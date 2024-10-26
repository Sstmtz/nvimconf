local M = {}

local map = vim.keymap.set
local settings = require "global.settings"
-- local conf = require("nvconfig").ui.lsp

M.on_attach = function(_, bufnr)
    -- if client.server_capabilities.documentSymbolProvider then
    --     require("nvim-navic").attach(client, bufnr)
    -- end

    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end

    map({ "n", "v" }, "gD", vim.lsp.buf.declaration, opts "Go to declaration")
    map({ "n", "v" }, "gd", vim.lsp.buf.definition, opts "Go to definition")
    map({ "n", "v" }, "gtD", vim.lsp.buf.type_definition, opts "Go to type definition")
    map({ "n", "v" }, "gi", vim.lsp.buf.implementation, opts "Go to implementation")
    map({ "n", "v" }, "gK", vim.lsp.buf.signature_help, opts "Show signature help")
    map({ "n", "v" }, "K", vim.lsp.buf.hover, opts "Show hover")
    map({ "n", "v" }, "gr", vim.lsp.buf.references, opts "Show references")
    map({ "n", "v" }, "gw", function()
        vim.lsp.buf.code_action { apply = true }
    end, opts "Code action")
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts "List workspace folders")

    -- 查看类型继承图
    vim.keymap.set({ "v", "n" }, "gst", function()
        vim.lsp.buf.typehierarchy "subtypes"
    end, { desc = "List derived class hierarchy" })
    vim.keymap.set({ "v", "n" }, "gsT", function()
        vim.lsp.buf.typehierarchy "supertypes"
    end, { desc = "List base class hierarchy" })

    -- map("n", "<leader>ra", function()
    --     require "nvchad.lsp.renamer"()
    -- end, opts "NvRenamer")

    -- -- setup signature popup
    -- if conf.signature and client.server_capabilities.signatureHelpProvider then
    --   require("nvchad.lsp.signature").setup(client, bufnr)
    -- end
    --
    -- if client.supports_method "textDocument/inlayHint" then
    --   vim.lsp.inlay_hint.enable(true, { bufnr })
    -- end
end

M.toggle_inlay_hints = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr }, { bufnr })
end

M.on_init = function(client, _)
    if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

M.capabilities = settings.completion_system == "nvim-cmp"
        and vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )
    or vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

return M
