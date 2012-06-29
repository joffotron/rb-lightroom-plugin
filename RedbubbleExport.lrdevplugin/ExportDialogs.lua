local LrView = import 'LrView'
local bind = LrView.bind


ExportDialogs = {}

function ExportDialogs.startDialog(propertyTable)
end

function ExportDialogs.workDetailsDialog(viewFactory, propertyTable)
    return {
        {
            title = 'Redbubble Work Details',
            synopsis = 'Redbubble Metadata for your work'
        }
    }
end
