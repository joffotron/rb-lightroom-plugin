require 'ExportDialogs'
require 'RedbubbleUploadTask'

return {
    hideSections = { 'exportLocation' },
    allowFileFormats = nil,

    allowColorSpaces = nil,

    startDialog = ExportDialogs.startDialog,
    processRenderedPhotos = RedbubbleUploadTask.upload,

}