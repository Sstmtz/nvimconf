-- mason_lspconfig
local mason_lspconfig = require "mason-lspconfig"

mason_lspconfig.setup {
  ensure_installed = {
    "bashls", -- sh lsp
    "awk_ls", -- awk lsp
    "taplo", -- toml lsp
    "texlab", -- latex lsp
    -- "matlab_ls", -- matlab lsp
    "lua_ls", -- lua lsp
    --"rust-analyzer",
    "clangd", -- c/c++ lsp
    "cmake", -- cmake lsp
    "csharp_ls", -- c# lsp
    -- "java_language_server", -- java lsp
    "jdtls", -- java lsp
    "pylsp", -- python lsp
    "gopls", -- go lsp
    -- "sqls", -- sql lsp
    "cssls", -- css lsp
    "html", -- html lsp
    "jsonls", -- json lsp
    "lemminx", -- xml lsp
    "yamlls", -- yaml lsp
    "tsserver", -- javascript/typescript lsp
    "ruff", -- python lsp
    -- "vuels", -- vue ls
    "volar", -- vue ls
    -- "emmet_ls", -- emmet_ls lsp
    "svelte", -- svelte lsp
    "graphql", -- graphQL lsp
    "dockerls", -- docker lsp
  },
}
