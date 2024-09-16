local settings = require "global.settings"
if settings.enable_nvchad then
    require "nvchad.options"
end

-- add yours here!

vim.g.toggle_theme_icon = "   "

-- tab & indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- [plugin] luasnip
-- vim.g.vscode_snippets_exclude = vim.fn.stdpath "config" .. "/snippets/vscode/"
-- vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/snippets/vscode"
-- vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/snippets/lua"

vim.g.netrw_liststyle = 3
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- [frontend] neovide
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.g.neovide_text_gamma = 0.8
    vim.g.neovide_text_contrast = 0.1
    vim.g.neovide_refresh_rate_idle = 5
    vim.g.neovide_cursor_vfx_mode = "railgun"
end
