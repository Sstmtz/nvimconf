return {
  "mfussenegger/nvim-jdtls",
  event = "VeryLazy",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require "configs.lsp.clients.nvim-jdtls"
  end,
}
