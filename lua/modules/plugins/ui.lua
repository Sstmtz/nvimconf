local UI = {}

local settings = require "global.settings"

-- gitsigns
UI["lewis6991/gitsigns.nvim"] = {
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    config = require "ui.gitsigns",
}

-- nvim-web-devicons
UI["nvim-tree/nvim-web-devicons"] = {
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    opts = {},
    config = function(_, opts)
        require("nvim-web-devicons").setup(opts)
    end,
}

-- noice
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

-- indent-blankline
UI["lukas-reineke/indent-blankline.nvim"] = {
    event = "User FilePost",
    main = "ibl",
    config = require "ui.indent-blankline",
}

-- todo-comments
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

-- dressing
UI["stevearc/dressing.nvim"] = {
    event = "VeryLazy",
}

-- aerial
-- UI["stevearc/aerial.nvim"] = {
--     event = "VeryLazy",
--     -- Optional dependencies
--     dependencies = {
--         "nvim-treesitter/nvim-treesitter",
--         "nvim-tree/nvim-web-devicons",
--     },
--     config = require "ui.aerial",
-- }

-- lspkind
-- UI["onsails/lspkind.nvim"] = {
--     config = require "ui.lspkind",
--     enabled = settings.completion_system == "nvim-cmp", -- it means if you use blinkcmp, you should disable this, see details: blinkcmp#17
-- }

-- alpha
-- UI["goolord/alpha-nvim"] = {
--   lazy = true,
--   event = "BufWinEnter",
--   config = require "ui.alpha",
-- }

-- dashboard
UI["nvimdev/dashboard-nvim"] = {
    event = { "UIEnter", "VimEnter" },
    config = require "ui.dashboard",
    enabled = settings.enable_dashboard,
}

-- paint: Easily add additional highlights to your buffers.
UI["folke/paint.nvim"] = {
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    config = require "ui.paint",
}

-- neodim: dimming the highlights of unused functions, variables, parameters, and more.
UI["zbirenbaum/neodim"] = {
    event = "LspAttach",
    config = require "ui.neodim",
}

-- headlines
-- UI["lukas-reineke/headlines.nvim"] = {
--     opts = require "ui.headlines",
--     ft = { "markdown", "norg", "rmd", "org" },
--     config = function(_, opts)
--         -- PERF: schedule to prevent headlines slowing down opening a file
--         vim.schedule(function()
--             require("headlines").setup(opts)
--             require("headlines").refresh()
--         end)
--     end,
-- }

-- edgy: easily create and manage predefined window layouts, bringing a new edge to your workflow.
-- if settings.file_tree == "neo-tree" then
--     UI["folke/edgy.nvim"] = {
--         event = "VeryLazy",
--         init = function()
--             vim.opt.laststatus = 3
--             vim.opt.splitkeep = "screen"
--         end,
--         opts = require "ui.edgy",
--         keys = {
--       -- stylua: ignore
--       { "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
--         },
--     }
-- end

-- nvim-scrollbar
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

-- fidget
UI["j-hui/fidget.nvim"] = {}

return UI
