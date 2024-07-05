local on_attach = require("utils.lsp").on_attach
local capabilities = require("utils.lsp").capabilities

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}
