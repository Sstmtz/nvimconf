local Mason = {}

-- mason-lspconfig
Mason["williamboman/mason-lspconfig.nvim"] = {
  event = { "BufReadPre", "BufNewFile" },
  -- config = require("mason.mason-lspconfig"),
}

-- mason-null-ls
Mason["jay-babu/mason-null-ls.nvim"] = {
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  -- config = require "mason.mason-null-ls",
}

-- mason-nvim-dap
Mason["jay-babu/mason-nvim-dap.nvim"] = {
  cmd = { "DapInstall", "DapUninstall" },
  dependencies = "williamboman/mason.nvim",
  config = require "mason.mason-nvim-dap",
}

-- masoon-registry
Mason["mason-org/mason-registry"] = {}

return Mason
