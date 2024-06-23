local on_attach = require("keymap.on_attach").gitsigns

local options = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "󰍵" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "│" },
  },
  on_attach = on_attach,
  watch_gitdir = { interval = 1000, follow_files = true },
  current_line_blame = true,
  current_line_blame_opts = { delay = 1000, virtual_text_pos = "eol" },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  word_diff = false,
  diff_opts = { internal = true },
}

return options
