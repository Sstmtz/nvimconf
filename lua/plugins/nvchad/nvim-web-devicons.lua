return {
  "nvim-tree/nvim-web-devicons",
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "devicons")
    require("nvim-web-devicons").setup(opts)
  end,
}
