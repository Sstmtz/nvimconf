local Code = {}

Code["nvimdev/lspsaga.nvim"] = {
  event = "LspAttach",
  ft = { "c", "cpp", "lua", "rust", "go", "python", "java", "typescript", "javascript" },
  config = require "code.lspsaga",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}

Code["ray-x/lsp_signature.nvim"] = {
  config = require "code.lsp-signature",
}

Code["dnlhc/glance.nvim"] = {
  event = "LspAttach",
  config = require "code.glance",
}

Code["Saecki/crates.nvim"] = {
  event = "BufReadPost Cargo.toml",
  ft = { "toml" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    completion = {
      cmp = { enabled = true },
    },
  },
  config = require "code.crates",
}

Code["mrcjkb/rustaceanvim"] = {
  version = "^4",
  lazy = false,
  ft = { "rust" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = require "code.rustaceanvim",
}


Code["ThePrimeagen/refactoring.nvim"] = {
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

Code["p00f/clangd_extensions.nvim"] = {
  opts = require "code.clangd_extensions",
}

Code["nvim-neotest/neotest"] = {
  opts = {
    adapters = {
      ["neotest-golang"] = {
        -- Here we can set options for neotest-golang, e.g.
        -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
        dap_go_enabled = true, -- requires leoluz/nvim-dap-go
      },
      ["rustaceanvim.neotest"] = {},
    },
  },
  dependencies = {
    "fredrikaverpil/neotest-golang",
  },
}

Code["b0o/SchemaStore.nvim"] = {
  lazy = true,
  version = false, -- last release is way too old
}

return Code
