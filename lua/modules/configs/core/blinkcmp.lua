return function()
    local options = {
        keymap = {
            show = "<C-space>",
            hide = "<C-e>",
            accept = "<Enter>",
            select_prev = { "<Up>", "<S-Tab>" },
            select_next = { "<Down>", "<Tab>" },

            show_documentation = {},
            hide_documentation = {},
            scroll_documentation_up = "<C-b>",
            scroll_documentation_down = "<C-f>",

            snippet_forward = "<Tab>",
            snippet_backward = "<S-Tab>",
        },

        highlight = {
            ns = vim.api.nvim_create_namespace "blink_cmp",
            -- sets the fallback highlight groups to nvim-cmp's highlight groups
            -- useful for when your theme doesn't support blinkcmp
            -- will be removed in a future release, assuming themes add support
            use_nvim_cmp_as_default = false,
        },

        kind_icons = {
            Text = "",
            Method = "󰆧",
            Function = "ƒ",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "󰑭",
            Value = "󰰪",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰊄",
        },
    }
    return options
end
