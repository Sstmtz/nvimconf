return function()
    local icons = {
        ui = require("modules.utils.icons").get "ui",
        misc = require("modules.utils.icons").get "misc",
        git = require("modules.utils.icons").get("git", true),
        cmp = require("modules.utils.icons").get("cmp", true),
    }

    require("which-key").setup {
        plugins = {
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = false,
                nav = false,
                z = true,
                g = true,
            },
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true,
                suggestions = 24,
            },
        },

        icons = {
            breadcrumb = icons.ui.Separator,
            separator = icons.misc.Vbar,
            group = "",
        },
    }
end
