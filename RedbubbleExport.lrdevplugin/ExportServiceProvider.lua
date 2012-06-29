require 'ExportDialogs'
require 'RedbubbleUploadTask'

return {
    hideSections = { 'exportLocation', 'watermarking', 'fileNaming' },
    allowFileFormats = { 'JPEG' },
    allowColorSpaces = {'sRGB'},
    hidePrintResolution = true,
    canExportVideo = false,

    startDialog = ExportDialogs.startDialog,
    processRenderedPhotos = RedbubbleUploadTask.processRenderedPhotos,
    sectionsForTopOfDialog = ExportDialogs.workDetailsDialog,

}