return {
  "mfussenegger/nvim-jdtls",
  event = "VeryLazy",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require "configs.nvim-jdtls"
  end,
}
