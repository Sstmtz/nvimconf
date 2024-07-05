-- LSP Config
return {
  "neovim/nvim-lspconfig",
  -- event = "User FilePost",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- default lsp config
    require("utils.lsp").defaults()
    require "configs.lspconfig"
  end,
}
