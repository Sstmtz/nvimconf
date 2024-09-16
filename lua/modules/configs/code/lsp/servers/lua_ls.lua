-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/lua_ls.lua
return {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            -- version = "Lua 5.3",
            diagnostics = {
                globals = { "vim" },
                disable = { "different-requires", "undefined-field" },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.fn.expand "$VIMRUNTIME/lua",
                    vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                    -- vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
                    -- vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
            codeLens = {
                enable = true,
            },
            hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
            },
            format = { enable = false },
            telemetry = { enable = false },
            -- Do not override treesitter lua highlighting with lua_ls's highlighting
            semantic = { enable = false },
        },
    },
}
