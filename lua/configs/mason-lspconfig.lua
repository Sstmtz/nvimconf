-- mason_lspconfig
local lspconfig = require "lspconfig"
local mason_lspconfig = require "mason-lspconfig"
local cmp_nvim_lsp = require "cmp_nvim_lsp"

local capabilities = cmp_nvim_lsp.default_capabilities()

mason_lspconfig.setup_handlers {
  -- default handler for installed servers
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
    }
  end,
  ["svelte"] = function()
    -- configure svelte server
    lspconfig["svelte"].setup {
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
  ["graphql"] = function()
    -- configure graphql language server
    lspconfig["graphql"].setup {
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    }
  end,
  ["emmet_ls"] = function()
    -- configure emmet language server
    lspconfig["emmet_ls"].setup {
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    }
  end,
}
