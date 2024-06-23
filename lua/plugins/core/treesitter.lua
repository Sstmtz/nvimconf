return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",

  config = function()
    dofile(vim.g.base46_cache .. "syntax")
    dofile(vim.g.base46_cache .. "treesitter")

    local treesitter = require "nvim-treesitter.configs"
    treesitter.setup {
      -- enable syntax highlighting
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      -- autotag = {
      --   enable = true,
      -- },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        -- "tsx",
        "yaml",
        "html",
        "css",
        "xml",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "http",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        -- "query",
        "vimdoc",
        "c",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      modules = {},
      auto_install = false,
      sync_install = false,
      ignore_install = {},
      parser_install_dir = vim.fn.stdpath "cache" .. "/treesitter",
    }

    -- prefer git parsers
    require("nvim-treesitter.install").prefer_git = true
  end,
}
