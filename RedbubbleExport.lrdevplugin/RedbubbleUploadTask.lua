local LrHttp = import'LrHttp'
local LrFileUtils = import'LrFileUtils'
local LrFileUtils = import'LrFileUtils'

require'RedbubbleAPI'

RedbubbleUploadTask = {}

function RedbubbleUploadTask.processRenderedPhotos(functionContext, exportContext)

    local progressScope = exportContext:configureProgress{
        title = "Uploading work to Redbubbble"
    }

    for index, rendition in exportContext:renditions{ stopIfCanceled = true } do
        local photo = rendition.photo

        if not rendition.wasSkipped then
            local success, pathOrMessage = rendition:waitForRender()

            if success then
                local title = "Test work title"
                local description = "Description"
                local tags = "test"
                local media = "photography"
                local nsfw = 'false'
                local private = 'false'

                workUrl = RedbubbleAPI.uploadWork({
                    title = title,
                    description = description,
                    tags = tags,
                    media = media,
                    nsfw = nsfw,
                    private = private
                }, pathOrMessage)

                LrHttp.openUrlInBrowser(workUrl)

                LrFileUtils.delete( pathOrMessage )

                progressScope:done()
            end
        end
    end
end
