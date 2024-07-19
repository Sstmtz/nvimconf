return function()
  local settings = require "global.settings"
  local treesitter = require "nvim-treesitter.configs"

  treesitter.setup {
    -- enable syntax highlighting
    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = false,
    },
    -- enable indentation
    indent = { enable = true },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    -- autotag = {
    --   enable = true,
    -- },
    -- ensure these language parsers are installed
    ensure_installed = settings.treesitter_deps,

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
      },
    },
    modules = {},
    auto_install = false,
    sync_install = false,
    ignore_install = {},
    -- parser_install_dir = vim.fn.stdpath "cache" .. "/treesitter",
  }

  -- prefer git parsers
  require("nvim-treesitter.install").prefer_git = true
end
