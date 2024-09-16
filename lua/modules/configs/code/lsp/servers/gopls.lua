-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/gopls.lua
return {
    cmd = { "gopls", "-remote.debug=:0", "-remote=auto" },
    filetypes = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" },
    flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
    capabilities = {
        textDocument = {
            completion = {
                contextSupport = true,
                dynamicRegistration = true,
                completionItem = {
                    commitCharactersSupport = true,
                    deprecatedSupport = true,
                    preselectSupport = true,
                    insertReplaceSupport = true,
                    labelDetailsSupport = true,
                    snippetSupport = true,
                    documentationFormat = { "markdown", "plaintext" },
                    resolveSupport = {
                        properties = {
                            "documentation",
                            "details",
                            "additionalTextEdits",
                        },
                    },
                },
            },
        },
    },
    settings = {
        gopls = {
            staticcheck = true,
            semanticTokens = true,
            noSemanticString = true,
            usePlaceholders = true,
            completeUnimported = true,
            symbolMatcher = "Fuzzy",
            buildFlags = { "-tags", "integration" },
            codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
        },
        hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
        },
        analyses = {
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        semanticTokens = true,
    },
}
