local options = {
  ensure_installed = {
    -- "lua-language-server",        -- lua lsp

    -- "typescript-language-server", -- javascript/typescript lsp
    -- "js-debug-adapter",            -- javascript dap
    -- "eslint-lsp",                 -- eslint lsp
    "tailwindcss-language-server", -- css lsp

    -- "cpplint",   -- c/cpp linter
    -- "clangd",       -- c/cpp lsp
    "clang-format", -- c/cpp formatter
    -- "codelldb",     -- c/cpp dap

    -- "isort", -- python formatter
    -- "black", -- python formatter
    "debugpy", -- python dap
    -- "mypy",    -- python linter
    -- "pyright",   -- python lsp
    "ruff", -- python lsp & linter
    -- "python-lsp-server", -- python lsp

    -- "gopls",             -- go lsp
    "goimports", -- go formatter
    -- "gofmt",     -- go formatter

    "rust-analyzer", -- rust lsp
    -- "java-language-server", -- java lsp & dap
  },

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

return options
