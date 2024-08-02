return function()
  local options = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      html = { "prettier" },
      go = { "goimports", "gofumpt" },
      -- cpp = { "clang-format" },
      ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
      ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
    },

    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 3000,
      async = false,
      quiet = false,
      lsp_fallback = "fallback",
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
      ["markdown-toc"] = {
        condition = function(_, ctx)
          for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
            if line:find "<!%-%- toc %-%->" then
              return true
            end
          end
        end,
      },
      ["markdownlint-cli2"] = {
        condition = function(_, ctx)
          local diag = vim.tbl_filter(function(d)
            return d.source == "markdownlint"
          end, vim.diagnostic.get(ctx.buf))
          return #diag > 0
        end,
      },
    },
  }

  require("conform").setup(options)
end
