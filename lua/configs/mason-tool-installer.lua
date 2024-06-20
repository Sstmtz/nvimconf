local mason_tool_installer = require "mason-tool-installer"

mason_tool_installer.setup {
  ensure_installed = {
    "eslint_d",  -- eslint linter
    "isort",     -- python formatter
    -- "pylint",   -- python linter
    "stylua",    -- lua formatter
    "prettier",  -- Prettier formatter (几乎支持前端所有的文件格式)
    "prettierd", -- prettier formatter
  },
  -- integrations = {
  --   ["mason-lspconfig"] = true,
  --   ["mason-null-ls"] = true,
  --   ["mason-nvim-dap"] = true,
  -- },
}
