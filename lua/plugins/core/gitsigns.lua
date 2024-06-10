return {
  "lewis6991/gitsigns.nvim",
  event = "User FilePost",
  opts = function()
    return require "configs.gitsigns"
  end,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "git")
    require("gitsigns").setup(opts)
  end,
}
