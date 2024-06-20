-- mason_lspconfig
local lspconfig = require "lspconfig"
local mason_lspconfig = require "mason-lspconfig"
local cmp_nvim_lsp = require "cmp_nvim_lsp"

local capabilities = cmp_nvim_lsp.default_capabilities()

mason_lspconfig.setup {
  ensure_installed = {
    "lua_ls", -- lua lsp
    --"rust-analyzer",
    "clangd", -- c/cpp lsp
    "java_language_server", -- java lsp
    "pylsp", -- python lsp
    "gopls", -- go lsp
    "sqls", -- sql lsp
    "cssls", -- css lsp
    "html", -- html lsp
    "tsserver", -- javascript/typescript lsp
    "ruff", -- python lsp
    "emmet_ls", -- emmet_ls lsp
    "svelte", -- svelte lsp
    "graphql", -- graphQL lsp
  },
}
