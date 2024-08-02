return function()
  local dashboard_image = require("global.settings").dashboard_image
  require("dashboard").setup {

    theme = "hyper",
    config = {
      header = dashboard_image,
      shortcut = {
        -- action can be a function type
        {
          icon = " ",
          icon_hl = "@variable",
          desc = "Files",
          group = "Label",
          action = "Telescope find_files",
          key = "f",
        },
        { action = "Lazy", group = "@property", desc = " Lazy", icon = "󰒲 ", key = "l" },
        { action = "LazyExtras", group = "DiagnosticHint", desc = " Lazy Extras", icon = " ", key = "x" },
        { action = "Telescope live_grep", group = "Number", desc = " Find Text", icon = " ", key = "g" },
        { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
        { action = "qa", desc = " Quit", icon = " ", key = "q" },
      },
      packages = { enable = true }, -- show how many plugins neovim loaded
      -- limit how many projects list, action when you press key or enter it will run this action.
      -- action can be a functino type, e.g.
      -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
      project = { enable = true, limit = 8, icon = "your icon", label = "", action = "Telescope find_files cwd=" },
      mru = { limit = 10, icon = "your icon", label = "", cwd_only = false },
      footer = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
      end,
    },
  }
end
