return {
  "folke/todo-comments.nvim",
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require "configs.ui.todo"
  end,
}
