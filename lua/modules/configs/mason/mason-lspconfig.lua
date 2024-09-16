local settings = require "global.settings"

local M = {}

M.setup = function()
    local diagnostics_virtual_text = settings.diagnostics_virtual_text
    local diagnostics_level = settings.diagnostics_level

    local nvim_lsp = require "lspconfig"
    require("lspconfig.ui.windows").default_options.border = "rounded"

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = true,
        underline = true,
        virtual_text = diagnostics_virtual_text and {
            severity = {
                min = vim.diagnostic.severity[diagnostics_level],
            },
        } or false,
        -- set update_in_insert to false because it was enabled by lspsaga
        update_in_insert = false,
    })

    local opts = {
        capabilities = require("modules.utils.lsp").capabilities,
        on_attach = require("modules.utils.lsp").on_attach,
        on_init = require("modules.utils.lsp").on_init,
    }

    ---A handler to setup all servers defined under `lsp/servers/*.lua`
    ---@param lsp_name string
    local function mason_lsp_handler(lsp_name)
        -- rust_analyzer is configured using mrcjkb/rustaceanvim
        -- warn users if they have set it up manually
        if lsp_name == "rust_analyzer" then
            local config_exist = pcall(require, "completion.servers." .. lsp_name)
            if config_exist then
                vim.notify(
                    [[
`rust_analyzer` is configured independently via `mrcjkb/rustaceanvim`. To get rid of this warning,
please REMOVE your LSP configuration (rust_analyzer.lua) from the `servers` directory and configure
`rust_analyzer` using the appropriate init options provided by `rustaceanvim` instead.]],
                    vim.log.levels.WARN,
                    { title = "nvim-lspconfig" }
                )
            end
            return
        end

        -- Use preset if there is no user definition
        local ok, custom_handler = pcall(require, "code.lsp.servers." .. lsp_name)
        if not ok then
            -- Default to use factory config for server(s) that doesn't include a spec
            nvim_lsp[lsp_name].setup(opts)
            return
        elseif type(custom_handler) == "function" then
            --- See `clangd.lua` for example.
            custom_handler(opts)
        elseif type(custom_handler) == "table" then
            nvim_lsp[lsp_name].setup(vim.tbl_deep_extend("force", opts, custom_handler))
        else
            vim.notify(
                string.format(
                    "Failed to setup [%s].\n\nServer definition under `completion/servers` must return\neither a fun(opts) or a table (got '%s' instead)",
                    lsp_name,
                    type(custom_handler)
                ),
                vim.log.levels.ERROR,
                { title = "nvim-lspconfig" }
            )
        end
    end

    require("mason-lspconfig").setup {
        ensure_installed = settings.lsp_deps,
    }
    require("mason-lspconfig").setup_handlers { mason_lsp_handler }
end

return M
