return function()
    local settings = require "global.settings"
    local options = {
        formatters_by_ft = {
            lua = { "stylua" },
            css = { "prettier" },
            html = { "prettier" },
            go = { "goimports", "gofumpt" },
            cpp = { "clang-format" },
            markdown = { "prettier", "markdownlint-cli2", "markdown-toc" },
        },

        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = settings.format_timeout,
            async = false,
            quiet = false,
            lsp_fallback = "fallback",
        },
        formatters = {
            injected = { options = { ignore_errors = true } },
            inherit = false,
        },
    }

    require("conform").setup(options)
end
