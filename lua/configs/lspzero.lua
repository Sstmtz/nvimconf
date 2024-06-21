local lsp_zero = require "lsp-zero"

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps { buffer = bufnr }
end)

local lsp = require("lsp-zero").preset {}
lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps { buffer = bufnr }
end)

lsp.skip_server_setup { "jdtls" }

-- here you can setup the language servers
