local on_attach = require("configs.lspconfig").on_attach
local capabilities = require("configs.lspconfig").capabilities

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}
