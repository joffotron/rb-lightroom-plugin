require 'ExportDialogs'
require 'RedbubbleUploadTask'

return {
    hideSections = { 'exportLocation' },
    allowFileFormats = { 'JPEG' },
    hidePrintResolution = true,
    allowColorSpaces = {'sRGB'},

    startDialog = ExportDialogs.startDialog,
    processRenderedPhotos = RedbubbleUploadTask.upload,

}