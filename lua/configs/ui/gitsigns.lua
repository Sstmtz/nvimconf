local map = vim.keymap.set

local on_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  local function opts(desc)
    return { buffer = bufnr, desc = "Gitsigns" .. desc }
  end

  -- local function map(mode, l, r, desc)
  --   vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
  -- end

  -- hunk
  map({ "o", "x" }, "hi", ":<C-U>Gitsigns select_hunk<CR>", opts "Gitsigns select hunk")
  map("n", "]h", gs.next_hunk, opts "Next Hunk")
  map("n", "[h", gs.prev_hunk, opts "Prev Hunk")
  map("n", "<leader>hs", gs.stage_hunk, opts "Stage hunk")
  map("n", "<leader>hr", gs.reset_hunk, opts "Reset hunk")
  map("v", "<leader>hs", function()
    gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
  end, opts "Stage hunk")
  map("v", "<leader>hr", function()
    gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
  end, opts "Reset hunk")
  map("n", "<leader>hu", gs.undo_stage_hunk, opts "Undo stage hunk")
  map("n", "<leader>hp", gs.preview_hunk, opts "Preview hunk")
  -- buffer
  map("n", "<leader>hS", gs.stage_buffer, opts "Stage buffer")
  map("n", "<leader>hR", gs.reset_buffer, opts "Reset buffer")
  -- blame
  map("n", "<leader>hb", function()
    gs.blame_line { full = true }
  end, opts "Blame line")
  map("n", "<leader>hB", gs.toggle_current_line_blame, opts "Toggle line blame")
  -- diff
  map("n", "<leader>hd", gs.diffthis, opts "Diff this")
  map("n", "<leader>hD", function()
    gs.diffthis "~"
  end, opts "Diff this ~")
end

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
