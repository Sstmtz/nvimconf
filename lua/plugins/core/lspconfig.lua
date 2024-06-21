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
      "bashls", -- mason-lspconfig
      "awk_ls", -- mason-lspconfig
      "taplo", -- mason-lspconfig
      "texlab", -- mason-lspconfig
      -- "matlab_ls", -- mason-lspconfig
      "html", -- mason-lspconfig
      "cssls", -- mason-lspconfig
      "jsonls", --mason-lspconfig
      "lemminx", -- mason-lspconfig
      -- "sqls", -- mason-lspconfig
      -- "eslint",
      -- "pyright",
      -- "ruff_lsp",
      -- "tsserver",
      -- "gopls",
      "svelte",
      -- "lua_ls",
      "ccls", -- usr
      -- "graphql",
      -- "emmet_ls",
      "pylsp", -- mason-lspconfig
      "rust_analyzer", -- mason
      -- "java_language_server", -- mason-lspconfig
      "csharp_ls", -- mason-lspconfig
      -- "tailwindcss", -- mason
      "yamlls", -- mason-lspconfig
      "dockerls", -- mason-lspconfig
      -- "vuels",
      -- "volar",
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
        -- vue = {
        --   hybridMode = false,
        -- },
        -- plugins = {
        --   {
        --     name = "@vue/typescript-plugin",
        --     location = "~/.nvm/versions/node/v21.7.3/lib/node_modules/@vue/language-server",
        --     languages = { "vue" },
        --   },
        -- },
      },
      preference = {
        disableSuggestions = true,
      },
      filetypes = {
        "javascript",
        "typescript",
        -- "vue",
        -- "javascriptreact",
        -- "typescriptreact",
      },
      commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports",
        },
      },
    }

    -- volar
    lspconfig.volar.setup {
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      init_options = {
        vue = {
          hybridMode = false,
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

    -- csharp_ls
    lspconfig.csharp_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "csharp-ls" },
      filetypes = { "cs" },
      init_options = {
        AutomaticWorkspaceInit = true,
      },
      root_dir = function(startpath)
        return lspconfig.util.root_pattern "*.sln"(startpath)
          or lspconfig.util.root_pattern "*.csproj"(startpath)
          or lspconfig.util.root_pattern "*.fsproj"(startpath)
          or lspconfig.util.root_pattern ".git"(startpath)
      end,
      single_file_support = false,
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
          staticcheck = true,
          gofumpt = true,
        },
      },
      single_file_support = false,
    }

    -- jdtls
    lspconfig.jdtls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "jdtls", "-configuration", "~/.cache/jdtls/config", "-data", "~/.cache/jdtls/workspace" },
      filetypes = { "java" },
      init_options = {
        jvm_args = {},
        workspace = "~/.cache/jdtls/workspace",
      },
      single_file_support = false,
    }

    -- -- emmet_ls
    -- lspconfig.emmet_ls.setup {
    --   capabilities = capabilities,
    --   filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    -- }

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
