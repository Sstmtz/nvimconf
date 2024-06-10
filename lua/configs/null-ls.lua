local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

-- code action sources
local code_actions = null_ls.builtins.code_actions
-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics
-- formatting sources
local formatting = null_ls.builtins.formatting
-- hover sources
local hover = null_ls.builtins.hover
-- completion sources
local completion = null_ls.builtins.completion

local opts = {
  debug = false,
  sources = {
    -- -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.prettierd,
    -- null_ls.builtins.formatting.clang_format,
    -- null_ls.builtins.diagnostics.cppcheck,
    -- null_ls.builtins.diagnostics.mypy.with {
    --   extra_args = function()
    --     local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
    --     return { "--python-executable", virtual .. "/bin/python3" }
    --   end,
    -- },
    -- null_ls.builtins.formatting.gofumpt,
    -- null_ls.builtins.formatting.goimports,
    -- null_ls.builtins.formatting.golines,
    completion.spell,
    -- sh fmt
    formatting.shfmt,
    -- stylua
    formatting.stylua,
    -- go fmt
    formatting.goimports,
    -- html/css/js/ts/vue/react/... fmt
    formatting.prettier.with {
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "graphql",
        "astro",
        "markdown",
      },
      extra_filetypes = { "njk" },
      prefer_local = "node_modules/.bin",
    },
  },

  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return opts
