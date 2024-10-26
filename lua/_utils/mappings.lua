local map = vim.keymap.set

-- mode
map("n", ";", ":", { desc = "enter command mode" })
map("i", "jk", "<ESC>", { desc = "escape insert mode" })

-- line move
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- window switch
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- file related
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- show
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
-- neo-tree/nvim-tree
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
map("n", "<C-n>", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })

-- codeium
map("n", "<leader>c", "<cmd>CodeiumToggle<cr>", { desc = "toggle codeium" })
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

-- cmake-tools
map(
    { "n" },
    "<leader>cr",
    "<cmd>CMakeRunCurrentFile<cr>",
    { silent = true, noremap = true, desc = "cmake run current file" }
)

map(
    { "n" },
    "<Leader>coe",
    "<cmd>CMakeOpenExecutor<cr>",
    { silent = true, noremap = true, desc = "cmake open executor" }
)

map({ "n" }, "<Leader>cor", "<cmd>CMakeOpenRunner<cr>", { silent = true, noremap = true, desc = "cmake open runner" })
