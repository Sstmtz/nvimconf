require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- codeium
map("n", "<leader>cd", "<cmd>Codeium Disable<cr>", { desc = "Disable codeium" })
map("n", "<leader>ce", "<cmd>Codeium Enable<cr>", { desc = "Enable codeium" })
map("i", "<C-a>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

-- lspsaga
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Prev diagnostic" })
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Next diagnostic" })
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "Show hover doc" })

-- treesitter
map("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- lsp-signature
map({ "n" }, "<C-k>", function()
  require("lsp_signature").toggle_float_win()
end, { silent = true, noremap = true, desc = "toggle signature" })

map({ "n" }, "<Leader>k", function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })
