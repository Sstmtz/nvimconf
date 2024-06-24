return {
  "stevearc/aerial.nvim",
  event = "VeryLazy",
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require "configs.ui.aerial"
  end,
}
