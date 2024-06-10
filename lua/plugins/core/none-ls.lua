return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function()
    return require "configs.null-ls"
  end,
  config = function(_, opts)
    require("null-ls").setup(opts)
  end,
}
