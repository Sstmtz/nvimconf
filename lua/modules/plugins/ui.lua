local UI = {}

local settings = require "global.settings"

UI["lewis6991/gitsigns.nvim"] = {
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  config = require "ui.gitsigns",
}

UI["nvim-tree/nvim-web-devicons"] = {
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  opts = {},
  config = function(_, opts)
    require("nvim-web-devicons").setup(opts)
  end,
}

UI["folke/noice.nvim"] = {
  event = "VeryLazy",
  opts = {},
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    "nvim-treesitter/nvim-treesitter",
  },
  config = require "ui.noice",
}

UI["lukas-reineke/indent-blankline.nvim"] = {
  event = "User FilePost",
  config = require "ui.indent-blankline",
}

UI["folke/todo-comments.nvim"] = {
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = { "CursorHold", "CursorHoldI" },
  config = require "ui.todo",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- stylua: ignore
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
    { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
}

UI["stevearc/dressing.nvim"] = {
  event = "VeryLazy",
}

UI["stevearc/aerial.nvim"] = {
  event = "VeryLazy",
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = require "ui.aerial",
}

UI["onsails/lspkind.nvim"] = {
  config = require "ui.lspkind",
}

-- UI["goolord/alpha-nvim"] = {
--   lazy = true,
--   event = "BufWinEnter",
--   config = require "ui.alpha",
-- }

UI["nvimdev/dashboard-nvim"] = {
  event = { "UIEnter", "VimEnter" },
  config = require "ui.dashboard",
}

UI["folke/paint.nvim"] = {
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  config = require "ui.paint",
}

UI["zbirenbaum/neodim"] = {
  event = "LspAttach",
  config = require "ui.neodim",
}

if settings.file_tree == "neo-tree" then
  UI["folke/edgy.nvim"] = {
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    opts = require "ui.edgy",
  }
end

-- UI["petertriho/nvim-scrollbar"] = {
--   config = function()
--     require("hlslens").setup {
--       build_position_cb = function(plist, _, _, _)
--         require("scrollbar.handlers.search").handler.show(plist.start_pos)
--       end,
--     }
--   end,
--   dependencies = {
--     "kevinhwang91/nvim-hlslens",
--   },
-- }

return UI
