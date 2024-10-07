local M = {}

M.setup = function()
    require("lspconfig.ui.windows").default_options.border = "rounded"

    local icons = {
        ui = require("modules.utils.icons").get("ui", true),
        misc = require("modules.utils.icons").get("misc", true),
    }

    require("mason").setup {
        ui = {
            border = "single",
            icons = {
                package_pending = icons.ui.Pending,
                package_installed = icons.ui.Installed,
                package_uninstalled = icons.ui.Uninstalled,
            },
            keymaps = {
                toggle_server_expand = "<CR>",
                install_server = "i",
                update_server = "u",
                check_server_version = "c",
                update_all_servers = "U",
                check_outdated_servers = "C",
                uninstall_server = "X",
                cancel_installation = "<C-c>",
            },
        },
    }
end

return M
