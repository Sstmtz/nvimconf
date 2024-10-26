return function()
    local nvim_lsp = require "lspconfig"
    local settings = require "global.settings"
    require("code.neoconf").setup()
    require("core.mason").setup()
    require("mason.mason-lspconfig").setup()

    local opts = {
        capabilities = settings.completion_system == "nvim-cmp" and vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        ) or vim.lsp.protocol.make_client_capabilities(),
        on_init = function(client, _)
            if client.supports_method "textDocument/semanticTokens" then
                client.server_capabilities.semanticTokensProvider = nil
            end
        end,
    }

    opts.capabilities.textDocument.completion.completionItem = {
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

    -- Setup lsps that are not supported by `mason.nvim` but supported by `nvim-lspconfig` here.
    if vim.fn.executable "dart" == 1 then
        local _opts = require "code.lsp.servers.dartls"
        local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
        nvim_lsp.dartls.setup(final_opts)
    end

    pcall(vim.cmd.LspStart) -- Start LSPs
end
