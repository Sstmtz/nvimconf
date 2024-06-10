return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  keys = {
    { "gcc", mode = "n", desc = "Comment toggle current line" },
    { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
    { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
    { "gbc", mode = "n", desc = "Comment toggle current block" },
    { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
    { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
  },
  config = function()
    local comment = require "Comment"

    local ts_context_commentstring = require "ts_context_commentstring.integrations.comment_nvim"
    -- enable comment
    comment.setup {
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    }
  end,
}
