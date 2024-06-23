local conf = require("nvconfig").ui.lsp
local map = vim.keymap.set
local mapping = {}

-- gitsigns
function mapping.gitsigns(bufnr)
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

-- lspconfig
function mapping.lspconfig(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  -- local function map(mode, l, r, desc)
  --   vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
  -- end

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

  map("n", "<leader>ra", function()
    require "nvchad.lsp.renamer"()
  end, opts "NvRenamer")

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
  map("n", "gr", vim.lsp.buf.references, opts "Show references")

  -- setup signature popup
  if conf.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end

return mapping
