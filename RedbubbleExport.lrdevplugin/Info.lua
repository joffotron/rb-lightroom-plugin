return {
    LrSdkVersion = 3.0,
    LrSdkMinimumVersion = 3.0, -- minimum SDK version required by this plug-in

    LrToolkitIdentifier = 'com.redbubble.export',
    LrPluginName = LOC"$$$/HelloWorld/PluginName=Redbubble Export",

    -- Add the menu item to the File menu.

    LrExportServiceProvider = {
        title = "Redbubble",
        file = "ExportServiceProvider.lua",
    },

    VERSION = { major = 0, minor = 1, revision = 0, build = 1, }
}


