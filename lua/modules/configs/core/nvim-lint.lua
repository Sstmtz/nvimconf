return function()
  local lint = require "lint"

  lint.linters_by_ft = {
    -- javascript = { "eslint_d" },
    -- typescript = { "eslint_d" },
    -- javascriptreact = { "eslint_d" },
    -- typescriptreact = { "eslint_d" },
    -- svelte = { "eslint_d" },
    python = { "ruff" },
    -- c = { "clangdtidy" },
    -- cpp = { "cpplint" },
    cmake = { "cmakelint" },
    -- lua = { "luacheck" },
    markdown = { "markdownlint-cli2" },
    -- json = { "jsonlint" },
    -- yaml = { "yamllint" },
    -- bash = { "shellcheck" },
  }

  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
      lint.try_lint()
    end,
  })

  vim.keymap.set("n", "<leader>l", function()
    lint.try_lint()
  end, { desc = "Trigger linting for current file" })

  vim.keymap.set({ "n", "v" }, "gq", function()
    require("lint").try_lint()
  end)
end
