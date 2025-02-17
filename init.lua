vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  -- NvChad plugins
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins.ui",
    config = function()
      require "options"
    end,
  },
  -- Custom plugins
  { import = "plugins.core" },
  { import = "plugins.tools" },
  { import = "plugins.other" },
  { import = "plugins.ui" },
  { import = "plugins.libs" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults") --
dofile(vim.g.base46_cache .. "statusline") -- NvChad ui/statusline

-- NvChad autocmds
require "nvchad.autocmds"

-- mappings
vim.schedule(function()
  require "mappings"
end)
