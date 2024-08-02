return function()
  require("neodim").setup {
    alpha = 0.45,
    blend_color = "#10171f",
    refresh_delay = 75, -- time in ms to wait after typing before refreshing diagnostics
    hide = {
      virtual_text = true,
      signs = false,
      underline = false,
    },
    priority = 80,
    disable = {
      "alpha",
      "bigfile",
      "checkhealth",
      "dap-repl",
      "diff",
      "fugitive",
      "fugitiveblame",
      "git",
      "gitcommit",
      "help",
      "log",
      "notify",
      "NvimTree",
      "Outline",
      "qf",
      "TelescopePrompt",
      "text",
      "toggleterm",
      "undotree",
      "vimwiki",
    },
  }
end
