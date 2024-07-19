return function()
  local on_attach = require("modules.utils.lsp").on_attach
  local capabilities = require("modules.utils.lsp").capabilities
  vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {},
    -- LSP configuration
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
      default_settings = {
        -- rust-analyzer language server configuration
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            buildScripts = {
              enable = true,
            },
          },
          -- Add clippy lints for Rust.
          checkOnSave = true,
          procMacro = {
            enable = true,
            ignored = {
              ["async-trait"] = { "async_trait" },
              ["napi-derive"] = { "napi" },
              ["async-recursion"] = { "async_recursion" },
            },
          },
        },
        dap = {
          adapter = false,
          configuration = false,
          autoload_configurations = false,
        },
      },
    },
  }
  if vim.fn.executable "rust-analyzer" == 0 then
    vim.notify.error(
      "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
      { title = "rustaceanvim" }
    )
  end
end
