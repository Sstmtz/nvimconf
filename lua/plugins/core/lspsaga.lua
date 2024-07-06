return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  ft = { "c", "cpp", "lua", "rust", "go", "python", "java", "typescript", "javascript" },
  config = function()
    require "configs.lsp.lspsaga"
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
