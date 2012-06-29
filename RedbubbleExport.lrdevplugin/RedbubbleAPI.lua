local LrHttp = import'LrHttp'
local LrErrors = import'LrErrors'
local LrPathUtils = import'LrPathUtils'

local logger = import'LrLogger'('RedbubbleAPI')

local API_URL = 'http://redbubble.192.168.1.234.xip.io/api/works'

RedbubbleAPI = {}

function RedbubbleAPI.uploadWork(metadata, photoFilePath)
    logger:enable("print")

    local mimeChunks = {}

    -- First chunk is the metadata
    for paramKey, paramValue in pairs(metadata) do
        logger:info('Param: ' .. paramKey, 'Value: ' .. paramValue)
        mimeChunks[#mimeChunks + 1] = { name = paramKey, value = paramValue }
    end

    -- Second chunk is the image data
    local fileName = LrPathUtils.leafName(photoFilePath)
    mimeChunks[#mimeChunks + 1] = { name = 'photo', fileName = fileName, filePath = photoFilePath, contentType = 'application/octet-stream' }

    logger:info('Posting photo ', fileName, 'with ', photoFilePath, 'to', API_URL)
    local result, headers = LrHttp.postMultipart(API_URL, mimeChunks)

    if not result then
        if headers and headers.error then
            LrErrors.throwUserError( headers.error.nativeCode)
        end
    end

    --    Mac has different implementation with that on Windows when the server refuses the request.
    if headers.status ~= 200 then
        LrErrors.throwUserError(headers.status)
    end
    logger:info('Got result:', result)

    return result
end

