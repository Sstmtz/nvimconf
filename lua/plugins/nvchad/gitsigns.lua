return {
  "lewis6991/gitsigns.nvim",
  event = { "CursorHold", "CursorHoldI" },
  opts = function()
    return require "configs.ui.gitsigns"
  end,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "git")
    require("gitsigns").setup(opts)
  end,
}
