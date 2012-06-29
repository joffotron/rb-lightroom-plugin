require'RedbubbleAPI'

RedbubbleUploadTask = {}

function RedbubbleUploadTask.upload(functionContext, exportContext)

    for i, rendition in exportContext:renditions{ stopIfCanceled = true } do
        local photo = rendition.photo

        if not rendition.wasSkipped then
            local success, pathOrMessage = rendition:waitForRender()

            if success then
                local title = "Test work title"
                local description = "Description"
                local tags = "test,lightroom,photo"
                local media = "photography,design"
                local nsfw = 'false'
                local private = 'false'

                RedbubbleAPI.uploadPhoto({
                    title = title,
                    description = description,
                    tags = tags,
                    media = media,
                    nsfw = nsfw,
                    private = private
                }, pathOrMessage)
            end
        end
    end
end
