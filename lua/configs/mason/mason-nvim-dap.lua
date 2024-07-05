-- local dap = require "dap"
-- local dapui = require "dapui"
local mason_dap = require "mason-nvim-dap"

mason_dap.setup {
  ensure_installed = {
    "python",
    "js",
    "codelldb",
    "bash",
    "javadbg",
    "delve",
  },
  automatic_installation = true,
  -- handlers = { mason_dap_handler },
  handlers = {
    function(config)
      -- all sources with no handler get passed here
      -- Keep original functionality
      require("mason-nvim-dap").default_setup(config)
    end,
  },
}
