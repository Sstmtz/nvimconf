-- mason_lspconfig
local mason_lspconfig = require "mason-lspconfig"

mason_lspconfig.setup {
  ensure_installed = {
    "lua_ls",               -- lua lsp
    --"rust-analyzer",
    "clangd",               -- c/cpp lsp
    "java_language_server", -- java lsp
    "pylsp",                -- python lsp
    "gopls",                -- go lsp
    "sqls",                 -- sql lsp
    "cssls",                -- css lsp
    "html",                 -- html lsp
    "tsserver",             -- javascript/typescript lsp
    "ruff",                 -- python lsp
    "emmet_ls",             -- emmet_ls lsp
    "svelte",               -- svelte lsp
    "graphql",              -- graphQL lsp
  },
}
