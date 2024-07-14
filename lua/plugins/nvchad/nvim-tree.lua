return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  opts = function()
    return require "nvchad.configs.nvimtree"
  end,
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
}
