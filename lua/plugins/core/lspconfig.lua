-- LSP Config
return {
  "neovim/nvim-lspconfig",
  event = "User FilePost",
  config = function()
    require("configs.lspconfig").defaults()

    local on_attach = require("configs.lspconfig").on_attach
    local on_init = require("configs.lspconfig").on_init
    local capabilities = require("configs.lspconfig").capabilities

    local lspconfig = require "lspconfig"
    local util = require "lspconfig/util"

    local servers = {
      "html", -- mason-lspconfig
      "cssls", -- mason-lspconfig
      -- "eslint",
      -- "pyright",
      -- "ruff_lsp",
      -- "tsserver",
      -- "gopls",
      "svelte",
      -- "lua_ls",
      "ccls", -- usr
      "graphql",
      "emmet_ls",
      "pylsp", -- mason-lspconfig
      "rust_analyzer", -- mason
      "java_language_server", -- mason-lspconfig
      "tailwindcss", -- mason
    }

    -- 代码诊断图标
    local signs = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- lsps with default config
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
    end

    local function organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
      }
      vim.lsp.buf.execute_command(params)
    end

    -- tsserver
    lspconfig.tsserver.setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
      init_options = {
        preference = {
          disableSuggestions = true,
        },
      },
      commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports",
        },
      },
    }

    -- clangd
    lspconfig.clangd.setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      root_dir = util.root_pattern(
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git"
      ),
      single_file_support = false,
    }

    -- ccls
    lspconfig.ccls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      offset_encoding = "utf-32",
      root_dir = util.root_pattern("compile_commands.json", ".ccls", ".git"),
      init_options = {
        compilationDatabaseDirectory = "build",
        index = {
          threads = 0,
        },
        clang = {
          excludeArgs = { "-frounding-math" },
        },
        cache = {
          directory = ".ccls-cache",
        },
      },
    }

    -- gopls
    lspconfig.gopls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    }
    -- emmet_ls
    lspconfig.emmet_ls.setup {
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    }

    -- graphql
    lspconfig.graphql.setup {
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    }

    -- svelte
    lspconfig.svelte.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            -- Here use ctx.match instead of ctx.file
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
          end,
        })
      end,
    }
  end,
}
