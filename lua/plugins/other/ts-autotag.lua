return {
  "windwp/nvim-ts-autotag",
  event = { "BufReadPre", "BufNewFile" },
  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  config = function(_, opts)
    require("nvim-ts-autotag").setup(opts)
  end,
}
