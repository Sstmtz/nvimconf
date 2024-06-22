require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

-- general
map("n", "<C-h>", "<cmd> TmuxNavigateLeft <CR>", { desc = "windows left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight <CR>", { desc = "windows right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown <CR>", { desc = "windows down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp <CR>", { desc = "windows up" })

-- dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Run or continue the debugger" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })

-- dap_python
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "Test python method" })

-- dap_go
map("n", "<leader>dgt", function()
  require("dap-go").debug_test()
end, { desc = "Debug go test" })
map("n", "<leader>dgl", function()
  require("dap-go").debug_last()
end, { desc = "Debug last go test" })

-- gopher
map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "Add json struct tags" })
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "Add yaml struct tags" })

-- crates
map("n", "<leader>rcu", function()
  require("crates").upgrade_all_crates()
end, { desc = "update crates" })

-- trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map(
  "n",
  "<leader>cl",
  "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "LSP Definitions / references / ... (Trouble)" }
)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- rest
map("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "Run request under the cursor" })
map("n", "<leader>rl", "<cmd>Rest run last<cr>", { desc = "Re-run latest request" })

-- codeium
map("n", "<leader>cd", "<cmd>Codeium Disable<cr>", { desc = "Disable codeium" })
map("n", "<leader>ce", "<cmd>Codeium Enable<cr>", { desc = "Enable codeium" })

map("i", "<C-a>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
