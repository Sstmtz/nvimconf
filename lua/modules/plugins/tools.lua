local settings = require "global.settings"
local Tools = {}

Tools["kdheepak/lazygit.nvim"] = {
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
  },
}

Tools["mikavilpas/yazi.nvim"] = {
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  -- stylua: ignore
  keys = {
    -- 👇 in this section, choose your own keymappings!
    { "<leader>-", function() require("yazi").yazi() end, desc = "Open the file manager", },
    {
      -- Open in the current working directory
      "<leader>cw", function() require("yazi").yazi(nil, vim.fn.getcwd()) end, desc = "Open the file manager in nvim's working directory", },
  },
  opts = {
    yazi_floating_window_border = "rounded",
  },
}

Tools["ellisonleao/glow.nvim"] = {
  config = true,
  cmd = "Glow",
}

Tools["iamcco/markdown-preview.nvim"] = {
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    {
      "<leader>cp",
      ft = "markdown",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview",
    },
  },
  config = function()
    vim.cmd [[do FileType]]
  end,
}

Tools["lukas-reineke/headlines.nvim"] = {
  opts = require "tools.headlines",
  ft = { "markdown", "norg", "rmd", "org" },
  config = function(_, opts)
    -- PERF: schedule to prevent headlines slowing down opening a file
    vim.schedule(function()
      require("headlines").setup(opts)
      require("headlines").refresh()
    end)
  end,
}

Tools["Civitasv/cmake-tools.nvim"] = {
  event = "VeryLazy",
  init = function()
    local loaded = false
    local function check()
      local cwd = vim.uv.cwd()
      if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
        require("lazy").load { plugins = { "cmake-tools.nvim" } }
        loaded = true
      end
    end
    check()
    vim.api.nvim_create_autocmd("DirChanged", {
      callback = function()
        if not loaded then
          check()
        end
      end,
    })
  end,
  config = require "tools.cmake-tools",
}

if settings.use_copliot then
  Tools["zbirenbaum/copilot.lua"] = {
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require "tools.copilot"
    end,
    dependencies = { "zbirenbaum/copilot-cmp", config = require "tools.copilot-cmp" },
  }
end

Tools["Exafunction/codeium.vim"] = {
  event = "BufEnter",
}

Tools["mrjones2014/legendary.nvim"] = {
  -- since legendary.nvim handles all your keymaps/commands,
  -- its recommended to load legendary.nvim before other plugins
  priority = 10000,
  lazy = false,
  -- sqlite is only needed if you want to use frecency sorting
  -- dependencies = { 'kkharji/sqlite.lua' }
}

if not settings.enable_nvchad then
  Tools["akinsho/toggleterm.nvim"] = {
    lazy = true,
    cmd = {
      "ToggleTerm",
      "ToggleTermSetName",
      "ToggleTermToggleAll",
      "ToggleTermSendVisualLines",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualSelection",
    },
    config = require "tools.toggleterm",
  }
end

Tools["folke/which-key.nvim"] = {
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  opts_extend = { "spec" },
  opts = {
    spec = {
      { "<leader>o", group = "overseer" },
    },
  },
  config = require "tools.which-key",
}

Tools["kylechui/nvim-surround"] = {
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}

Tools["numToStr/Comment.nvim"] = {
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  keys = {
    { "gcc", mode = "n", desc = "Comment toggle current line" },
    { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
    { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
    { "gbc", mode = "n", desc = "Comment toggle current block" },
    { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
    { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
  },
  config = function()
    local comment = require "Comment"

    local ts_context_commentstring = require "ts_context_commentstring.integrations.comment_nvim"
    -- enable comment
    comment.setup {
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    }
  end,
}

Tools["folke/trouble.nvim"] = {
  cmd = "Trouble",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  config = require "tools.trouble",
}

Tools["nvim-pack/nvim-spectre"] = {
  build = false,
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "Replace in Files (Spectre)" },
  },
}

Tools["folke/flash.nvim"] = {
  event = "VeryLazy",
  vscode = true,
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}

Tools["folke/persistence.nvim"] = {
  event = "BufReadPre",
  opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session", },
    { "<leader>ql", function() require("persistence").load { last = true } end, desc = "Restore Last Session", },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session", },
  },
}

Tools["danymat/neogen"] = {
  config = true,
  cmd = "Neogen",
  -- stylua: ignore
  keys = {
    { "<leader>cn", function() require("neogen").generate() end, desc = "Generate Annotations (Neogen)", },
  },
}

Tools["gbprod/yanky.nvim"] = {
  recommended = true,
  desc = "Better Yank/Paste",
  event = "VeryLazy",
  opts = {
    highlight = { timer = 150 },
  },
}

Tools["stevearc/overseer.nvim"] = {
  cmd = {
    "OverseerOpen",
    "OverseerClose",
    "OverseerToggle",
    "OverseerSaveBundle",
    "OverseerLoadBundle",
    "OverseerDeleteBundle",
    "OverseerRunCmd",
    "OverseerRun",
    "OverseerInfo",
    "OverseerBuild",
    "OverseerQuickAction",
    "OverseerTaskAction",
    "OverseerClearCache",
  },
  -- stylua: ignore
  keys = {
    { "<leader>ow", "<cmd>OverseerToggle<cr>",      desc = "Task list" },
    { "<leader>oo", "<cmd>OverseerRun<cr>",         desc = "Run task" },
    { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
    { "<leader>oi", "<cmd>OverseerInfo<cr>",        desc = "Overseer Info" },
    { "<leader>ob", "<cmd>OverseerBuild<cr>",       desc = "Task builder" },
    { "<leader>ot", "<cmd>OverseerTaskAction<cr>",  desc = "Task action" },
    { "<leader>oc", "<cmd>OverseerClearCache<cr>",  desc = "Clear cache" },
  },
  opts = require "tools.overseer",
}

return Tools
