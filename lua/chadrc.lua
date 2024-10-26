-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

local settings = require "global.settings"

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "everblush",
    theme_toggle = { "onedark", "everblush" },
    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
}

M.ui = {
    cmp = {
        icons_left = false, -- only for non-atom styles!
        lspkind_text = true,
        style = "default", -- default/flat_light/flat_dark/atom/atom_colored
        format_colors = {
            tailwind = false, -- will work for css lsp too
            icon = "󱓻",
        },
    },

    statusline = {
        enabled = true,
        theme = "default", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow separators work only for default statusline theme
        -- round and block will work for minimal theme only
        separator_style = "default",
        order = nil,
        modules = nil,
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
        enabled = true,
        lazyload = true,
        order = { "treeOffset", "buffers", "tabs", "btns" },
        modules = nil,
    },

    telescope = { style = "borderless" }, -- borderless / bordered
}

M.nvdash = {
    load_on_startup = false,
}

M.cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
}

-- show color in virtual text
M.colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
}

return M
