local settings = require "global.settings"
local modules_dir = vim.fn.stdpath "config" .. "/lua/modules" -- default modules dir

local Lazy = {}

Lazy.config = {
  defaults = { lazy = true },
  install = { colorscheme = { settings.colorscheme } },

  pkg = {
    enabled = true,
    cache = vim.fn.stdpath "state" .. "/lazy/pkg-cache.lua",
    -- the first package source that is found for a plugin will be used.
    sources = {
      "lazy",
      "rockspec", -- will only be used when rocks.enabled is true
      "packspec",
    },
  },

  rocks = {
    enabled = true,
    root = vim.fn.stdpath "data" .. "/lazy-rocks",
    server = "https://nvim-neorocks.github.io/rocks-binaries/",
  },

  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}

-- Append modules config_path to "require search path"
function Lazy:append_nativertp()
  package.path = package.path
    .. string.format(";%s;%s", modules_dir .. "/configs/?.lua", modules_dir .. "/configs/?/init.lua")
end

-- Add plugins with single file setup
-- Format: M["plugins/plugin_name.lua"] = {}
function Lazy:spec_with_single_file()
  self.modules = {} -- store all modules

  -- Get file list
  -- For example: { "modules/plugins/plugin1.lua", "modules/plugins/plugin2.lua",...}
  local get_file_list = function()
    local plugin_pattern = modules_dir .. "/plugins/*.lua"
    local plugin_path_list = vim.split(vim.fn.glob(plugin_pattern), "\n") or {}

    local file_list = {}
    for _, plugin_path in ipairs(plugin_path_list) do
      local regex = "/([^/]+/[^/]+/[^/]+%.lua)$"
      local filename = string.gsub(plugin_path:match(regex), "/", ".") -- replace "/" with "."
      table.insert(file_list, filename)
    end
    return file_list
  end

  self:append_nativertp()

  -- Add plugins with config
  for _, m in ipairs(get_file_list()) do
    local modules = require(m:sub(0, #m - 4)) -- remove the ".lua" extension
    if type(modules) == "table" then
      for name, conf in pairs(modules) do
        table.insert(self.modules, vim.tbl_extend("force", { name }, conf)) -- merge two tables and force override: {name, conf}
      end
    end
  end

  -- Set installed plugins be disabled
  for _, name in ipairs(settings.disabled_plugins) do
    table.insert(self.modules, { name, enabled = false }) -- set "enable = false" to disable plugin
  end
end

-- Bootstrap lazy.nvim
-- More details: https://lazy.folke.io/installation
function Lazy:install_plugins()
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

  -- install lazy.nvim if it doesn't already exist
  if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = settings.use_ssh and "git@github.com:folke/lazy.nvim.git"
      or "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system { "git", "clone", "--filter=blob:none", lazyrepo, "--branch=stable", lazypath }
    -- if last shell command(git clone) failed, then show error and press any key to exit nvim
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end

  -- add "lazypath" to the runtime path(rtp) of vim
  vim.opt.rtp:prepend(lazypath)
  -- set "mapleader" and "maplocalleader" before loading lazy.nvim
  vim.g.mapleader = " "
  vim.g.maplocalleader = "\\"
  -- if you're ready to install "NvChad", make sure set the global variable
  if settings.enable_nvchad then
    vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
  end

  -- load lazy.nvim
  self:spec_with_single_file()
  require("lazy").setup({
    {
      "NvChad/NvChad",
      lazy = false,
      enable = settings.enable_nvchad,
      import = "nvchad.plugins",
      config = function()
        require "options"
      end,
    },
    self.modules,
  }, self.configs)

  -- run nvchad config if NvChad is enabled
  if settings.enable_nvchad then
    -- load theme
    dofile(vim.g.base46_cache .. "defaults")
    dofile(vim.g.base46_cache .. "statusline")

    require "nvchad.autocmds"

    vim.schedule(function()
      require "mappings"
    end)
  end
end

return Lazy
