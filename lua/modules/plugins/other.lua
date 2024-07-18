local Other = {}

Other["windwp/nvim-ts-autotag"] = {
  event = { "BufReadPre", "BufNewFile" },
  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}

Other["kylechui/nvim-surround"] = {
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}

Other["folke/lazydev.nvim"] = {
  t = "lua", -- only load on lua files
  opts = {
    library = {
      -- See the configuration section for more details
      -- Load luvit types when the `vim.uv` word is found
      { path = "luvit-meta/library", words = { "vim%.uv" } },
      "lazy.nvim",
      "luvit-meta/library",
    },
  },
  dependencies = { "Bilal2453/luvit-meta", lazy = true },
}

Other["folke/zen-mode.nvim"] = {}

Other["karb94/neoscroll.nvim"] = {
  config = require "other.neoscroll",
}

return Other
