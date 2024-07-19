return function()
  local settings = require "global.settings"
  local mason_dap = require "mason-nvim-dap"

  ---A handler to setup all clients defined under `tool/dap/clients/*.lua`
  ---@param config table
  local function mason_dap_handler(config)
    local dap_name = config.name
    local ok, custom_handler = pcall(require, "user.configs.dap-clients." .. dap_name)
    if not ok then
      -- Use preset if there is no user definition
      ok, custom_handler = pcall(require, "code.dap.clients." .. dap_name)
    end
    if not ok then
      -- Default to use factory config for clients(s) that doesn't include a spec
      mason_dap.default_setup(config)
      return
    elseif type(custom_handler) == "function" then
      -- Case where the protocol requires its own setup
      -- Make sure to set
      -- * dap.adpaters.<dap_name> = { your config }
      -- * dap.configurations.<lang> = { your config }
      -- See `codelldb.lua` for a concrete example.
      custom_handler(config)
    else
      vim.notify(
        string.format(
          "Failed to setup [%s].\n\nClient definition under `tool/dap/clients` must return\na fun(opts) (got '%s' instead)",
          config.name,
          type(custom_handler)
        ),
        vim.log.levels.ERROR,
        { title = "nvim-dap" }
      )
    end
  end

  require("mason-nvim-dap").setup {
    handlers = { mason_dap_handler },
    ensure_installed = settings.dap_deps,
    automatic_installation = true,
  }
end
