return function()
    local lspsaga = require "lspsaga"

    lspsaga.setup {
        border_style = "round",
        error_sign = " ",
        warn_sign = " ",
        hint_sign = " ",
        infor_sign = " ",
        diagnostic_header_icon = " ",
        code_action_icon = " ",
        code_action_prompt = {
            enable = false,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
        },
        ui = {
            border = "rounded",
            devicon = true,
            foldericon = true,
            title = true,
            expand = "⊞",
            collapse = "⊟",
            code_action = "💡",
            action = "",
            actionfix = " ",
            lines = { "┗", "┣", "┃", "━", "┏" },
            imp_sign = "󰳛 ",
        },
        lightbulb = {
            enable = false,
            enable_in_insert = false,
            sign = false,
            sign_priority = 40,
            virtual_text = true,
        },
        finder = {
            max_width = 0.5,
            left_width = 0.3,
            right_width = 0.3,
            default = "def+ref+imp",
            layout = "float",
            silent = false,
        },
        code_action = {
            num_showcut = true,
            show_server_name = false,
            keys = {
                quit = "q",
                exec = "<CR>",
            },
        },
        rename = {
            quit = "<C-c>",
            exec = "<CR>",
            mark = "x",
            confirm = "<CR>",
            in_select = true,
        },
        hover = {
            max_width = 0.6,
            max_height = 0.4,
            auto_preview = false,
            open_link = "gx",
            open_cmd = "!chromium",
            preview = {
                quit = "q",
            },
        },
        symbol_in_winbar = {
            enable = false, -- replaced by dropbar.nvim
            separator = "/",
            ignore_patterns = {},
            hide_keyword = true,
            show_file = true,
            folder_level = 2,
            respect_root = false,
            color_mode = true,
        },
        implement = {
            enable = true,
            sign = true,
            virtual_text = true,
            priority = 100,
        },
        outline = {
            win_position = "right",
            win_width = 30,
            detail = true,
            auto_preview = false,
            auto_refresh = true,
            auto_close = true,
            custom_sort = nil,
            keys = {
                jump = "o",
                expand_collapse = "u",
                quit = "q",
            },
        },
    }
end
