local settings = require "global.settings"
return function()
    require("toggleterm").setup {
        -- size can be a number or function which is passed the current terminal
        size = function(term)
            if term.direction == "horizontal" then
                return 10
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        on_open = function(term)
            -- Prevent infinite calls from freezing neovim.
            -- Only set these options specific to this terminal buffer.
            vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
            vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })

            if settings.file_tree == "nvim-tree" then
                -- Prevent horizontal terminal from obscuring `nvim-tree`.
                local api = require "nvim-tree.api"
                local tree = require "nvim-tree.view"
                if tree.is_visible() and term.direction == "horizontal" then
                    local width = vim.fn.winwidth(tree.get_winnr())
                    api.tree.toggle()
                    tree.View.width = width
                    api.tree.toggle(false, true)
                end
            end
        end,
        highlights = {
            Normal = {
                link = "Normal",
            },
            NormalFloat = {
                link = "NormalFloat",
            },
            FloatBorder = {
                link = "FloatBorder",
            },
        },
        open_mapping = [[<F8>]], -- [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        -- shade_filetypes = {},
        autochdir = true,
        shade_terminals = false,
        -- shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        terminal_mappings = true, -- whether or not the open mapping applies in the terminal
        persist_mode = true,
        persist_size = true,
        -- direction = "tab",
        direction = "vertical", -- or "horizontal" | "tab" | "float",
        close_on_exit = true, -- close the terminal window when the process exits
        auto_scroll = true,
        shell = vim.o.shell,
        -- This field is only relevant if direction is set to 'float'
        float_opts = {
            border = "curved",
            width = 70,
            height = 18,
            winblend = 3,
        },

        winbar = {
            enabled = false,
            name_formatter = function(term) --  term: Terminal
                return term.name
            end,
        },
    }
end
