local Other = {}

-- nvim-ts-autotag
Other["windwp/nvim-ts-autotag"] = {
    event = { "BufReadPre", "BufNewFile" },
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = require "other.autotag",
}

-- nvim-treesitter-context
Other["nvim-treesitter/nvim-treesitter-context"] = {
    -- event = { "BufReadPre", "BufNewFile" },
    cmd = { "TSContextEnable", "TSContextDisable", "TSContextToggle" },
    config = require "other.treesitter-context",
}

-- nvim-ts-context-commentstring
Other["JoosepAlviste/nvim-ts-context-commentstring"] = {
    event = { "BufReadPre", "BufNewFile" },
    config = require "other.ts-context-commentstring",
}

-- lazydev
Other["folke/lazydev.nvim"] = {
    ft = "lua", -- only load on lua files
    opts = {
        library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            "lazy.nvim",
            "luvit-meta/library",
            { path = "luvit-meta/library", words = { "vim%.uv" } },
            -- Load the wezterm types when the `wezterm` module is required
            -- Needs `justinsgithub/wezterm-types` to be installed
            -- { path = "wezterm-types", mods = { "wezterm" } },
            -- Load the xmake types when opening file named `xmake.lua`
            -- Needs `LelouchHe/xmake-luals-addon` to be installed
            -- { path = "xmake-luals-addon/library", files = { "xmake.lua" } },
        },
        -- always enable unless `vim.g.lazydev_enabled = false`
        -- This is the default
        enabled = function(root_dir)
            return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
        end,
        -- -- disable when a .luarc.json file is found
        -- enabled = function(root_dir)
        --     return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
        -- end,
    },
    dependencies = { "Bilal2453/luvit-meta", lazy = true },
}

-- zen-mode
Other["folke/zen-mode.nvim"] = {}

-- twilight
Other["folke/twilight.nvim"] = {
    ft = "markdown",
}

-- legendary
Other["mrjones2014/legendary.nvim"] = {
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    -- sqlite is only needed if you want to use frecency sorting
    -- dependencies = { 'kkharji/sqlite.lua' }
}

return Other
