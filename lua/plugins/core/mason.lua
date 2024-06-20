return {

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = function()
      return require "configs.mason"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "mason")
      require("mason").setup(opts)

      -- custom nvchad cmd to install all mason binaries listed
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd "Mason"
          local mr = require "mason-registry"

          mr.refresh(function()
            for _, tool in ipairs(opts.ensure_installed) do
              local p = mr.get_package(tool)
              if not p:is_installed() then
                p:install()
              end
            end
          end)
        end
      end, {})

      vim.g.mason_binaries_list = opts.ensure_installed

      local mason_tool_installer = require "mason-tool-installer"

      mason_tool_installer.setup {
        ensure_installed = {
          -- "eslint_d",  -- eslint linter
          "isort",     -- python formatter
          -- "pylint",   -- python linter
          "stylua",    -- lua formatter
          "prettier",  -- Prettier formatter (几乎支持前端所有的文件格式)
          "prettierd", -- prettier formatter
        },
      }
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require "configs.mason-lspconfig"
    end,
  },
}
