return function()
  local settings = require "global.settings"
  local null_ls = require "null-ls"
  local btns = null_ls.builtins

  ---Return formatter args required by `extra_args`
  ---@param formatter_name string
  ---@return table|nil
  local function formatter_args(formatter_name)
    local args = require("code.formatters." .. formatter_name) or nil
    return args
  end

  -- Please set additional flags for the supported servers here
  -- Don't specify any config here if you are using the default one.
  local sources = {
    btns.formatting.clang_format.with {
      filetypes = { "c", "cpp", "objc", "objcpp", "cs", "java", "cuda", "proto" },
      extra_args = formatter_args "clang_format",
    },
    btns.formatting.prettier.with {
      filetypes = {
        "vue",
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
        "yaml",
        "html",
        "css",
        "scss",
        "sh",
        "markdown",
      },
    },
    btns.formatting.black.with {
      filetypes = {
        "python",
      },
    },
    btns.diagnostics.cmake_lint.with {
      filetypes = {
        "cmake",
      },
    },
    btns.code_actions.gomodifytags,
    btns.code_actions.impl,
    btns.formatting.goimports,
    btns.formatting.gofumpt,
    btns.diagnostics.markdownlint_cli2,
  }

  null_ls.setup {
    border = "rounded",
    debug = false,
    log_level = "warn",
    update_in_insert = false,
    sources = sources,
    default_timeout = settings.format_timeout,
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
  }

  require("mason.mason-null-ls").setup()
end
