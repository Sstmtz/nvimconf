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
      "html",
      "cssls",
      -- "clangd",
      "eslint",
      "pyright",
      "ruff_lsp",
      -- "tsserver",
      -- "gopls",
      "svelte",
      -- "lua_ls",
      "graphql",
      "emmet_ls",
      --"tailwindcss",  --uninstalled
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
    }

    -- ccls
    lspconfig.ccls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      offset_encoding = "utf-32",
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
  end,

  --
}
