local settings = require "global.settings"

return function()
    if settings.enable_nvchad then
        dofile(vim.g.base46_cache .. "git")
    end
    require("gitsigns").setup {
        signs = {
            add = { text = "│" },
            change = { text = "│" },
            delete = { text = "󰍵" },
            changedelete = { text = "󱕖" },
            topdelete = { text = "‾" },
            untracked = { text = "│" },
        },
        on_attach = nil,
        watch_gitdir = { interval = 1000, follow_files = true },
        current_line_blame = true,
        current_line_blame_opts = { delay = 1000, virtual_text_pos = "eol" },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        word_diff = false,
        diff_opts = { internal = true },
    }
end
