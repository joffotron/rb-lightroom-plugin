local LrView = import 'LrView'
local bind = LrView.bind


ExportDialogs = {}

function ExportDialogs.startDialog(propertyTable)
end

function ExportDialogs.workDetailsDialog(ui, propertyTable)
    return {
        {
            title = 'Redbubble Work Details',
            synopsis = 'Redbubble Metadata for your work'
        },
--
--        ui:row{
--            ui:staticText{
--                title = "Fill in the details for your amazing work",
--                fill_horizontal = 1
--            }
--        },
--
--        ui:edit_field{
--            value = bind 'rb_work_title',
--            immediate = false,
--            fill_horizontal = 1,
--        },
    }
end
