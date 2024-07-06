local lsp_zero = require "lsp-zero"

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps { buffer = bufnr }
end)

require("mason").setup {}
require("mason-lspconfig").setup {
  ensure_installed = { "jdtls" },
  handlers = {
    -- this first function is the "default handler"
    -- it applies to every language server without a "custom handler"
    function(server_name)
      require("lspconfig")[server_name].setup {}
    end,

    -- this is the "custom handler" for `jdtls`
    -- noop is an empty function that doesn't do anything
    jdtls = lsp_zero.noop,
  },
}
