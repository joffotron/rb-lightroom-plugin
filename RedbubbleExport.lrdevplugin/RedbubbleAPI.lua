local LrHttp = import'LrHttp'
local LrErrors = import'LrErrors'
local LrPathUtils = import'LrPathUtils'

local logger = import'LrLogger'('RedbubbleAPI')

--local API_URL = 'http://api.redbubble.192.168.1.193.xip.io'
local API_URL = 'http://posttestserver.com/post.php?dir=redbubble'

RedbubbleAPI = {}

function RedbubbleAPI.uploadPhoto(metadata, photoFilePath)
    logger:enable("print")

    local mimeChunks = {}

    -- First chunk is the metadata
    for paramKey, paramValue in pairs(metadata) do
        logger:info( 'Param: ' .. paramKey, 'Value: ' .. paramValue )
        mimeChunks[#mimeChunks + 1] = { name = paramKey, value = paramValue }
    end

    -- Second chunk is the image data
    local fileName = LrPathUtils.leafName(photoFilePath)
    mimeChunks[#mimeChunks + 1] = { name = 'photo', fileName = fileName, filePath = photoFilePath, contentType = 'application/octet-stream' }

    logger:info('Posting photo ', fileName, 'with ', photoFilePath, 'to', API_URL)

    local response, headers = LrHttp.postMultipart(API_URL, mimeChunks)

    logger.info('Got result!: ', response)

    if not response then
        if headers and headers.error then
            LrErrors.throwUserError(headers.error.nativeCode)
        end
    end

    -- Mac has different implementation with that on Windows when the server refuses the request.
    if headers.status ~= 200 then
        LrErrors.throwUserError(headers.status)
    end

    -- response should be the URL of the work
    LrHttp.openUrlInBrowser(response)
end

