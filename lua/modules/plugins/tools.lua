local Tools = {}
local settings = require "global.settings"

----------------------------------------------------------------------------------------Built-in UI-------------------------------------------------------------------------------------------

-- lazygit
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

-- lazydocker
Tools["crnvl96/lazydocker.nvim"] = {
    lazy = true,
    event = "VeryLazy",
    opts = {}, -- automatically calls `require("lazydocker").setup()`
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>ld", "<cmd>LazyDocker<cr>", desc = "Open lazy docker" },
    },
}

-- neogit
Tools["NeogitOrg/neogit"] = {
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        -- "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed, not both.
        -- "nvim-telescope/telescope.nvim", -- optional
        -- "ibhagwan/fzf-lua", -- optional
    },
    config = true,
}

-- yazi
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

-------------------------------------------------------------------------------------------Notes----------------------------------------------------------------------------------------------

-- glow
Tools["ellisonleao/glow.nvim"] = {
    config = true,
    cmd = "Glow",
    ft = { "markdown" },
}

-- markdown-preview
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

-- neorg
Tools["nvim-neorg/neorg"] = {
    ft = { "norg", "org" },
    -- lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = require "tools.neorg",
}

-- render-markdown
Tools["MeanderingProgrammer/render-markdown.nvim"] = {
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = require "tools.render-markdown",
}

-------------------------------------------------------------------------------------Better Defaults------------------------------------------------------------------------------------------

-- comment
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

-- yanky
Tools["gbprod/yanky.nvim"] = {
    recommended = true,
    desc = "Better Yank/Paste",
    event = "VeryLazy",
    opts = {
        highlight = { timer = 150 },
    },
}

----------------------------------------------------------------------------------------Cursor Move------------------------------------------------------------------------------------------

-- flash
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

-- neoscroll
-- Tools["karb94/neoscroll.nvim"] = {
--     config = require "tools.neoscroll",
-- }

----------------------------------------------------------------------------------------Code Tools--------------------------------------------------------------------------------------------

-- -- curl
-- Tools["oysandvik94/curl.nvim"] = {
--     cmd = { "CurlOpen" },
--     dependencies = {
--         "nvim-lua/plenary.nvim",
--     },
--     config = true,
-- }

-- rest
Tools["rest-nvim/rest.nvim"] = {
    ft = "http",
    event = { "BufReadPre", "BufNewFile" },
}

-- kulala
Tools["mistweaverco/kulala.nvim"] = {
    ft = "http",
    keys = {
        { "<leader>R", "", desc = "+Rest" },
        { "<leader>Rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
        { "<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
        { "<leader>Rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
        { "<leader>Rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
    },
    opts = {},
}

-- cmake-tools
Tools["Civitasv/cmake-tools.nvim"] = {
    event = { "BufReadPre", "BufNewFile" },
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

-- flutter-tools
Tools["akinsho/flutter-tools.nvim"] = {
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
}

----------------------------------------------------------------------------------------Sessions----------------------------------------------------------------------------------------------

-- persistence
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

-- auto-session
-- Tools["rmagatti/auto-session"] = {
--     -- lazy = false,
--     dependencies = {
--         "nvim-telescope/telescope.nvim", -- Only needed if you want to use session lens
--     },
--     opts = {
--         auto_session_suppress_dirs = { "~/Projects", "~/Downloads" },
--         -- log_level = 'debug',
--     },
--     enabled = settings.use_autosession,
-- }

-- persisted
-- Tools["olimorris/persisted.nvim"] = {
--     lazy = true, -- if you use a dashboard
--     config = require "tools.persisted",
--     enabled = settings.use_autosession,
-- }

------------------------------------------------------------------------------------------Benchmarking----------------------------------------------------------------------------------------

-- startuptime
Tools["dstein64/vim-startuptime"] = {
    cmd = "StartupTime",
    config = function()
        vim.g.startuptime_tries = 10
    end,
}

-------------------------------------------------------------------------------------------Tasks & Jobs---------------------------------------------------------------------------------------

-- overseer
-- A task runner and job management plugin for Neovim.
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
    dependencies = { "rcarriga/nvim-notify" },
}

------------------------------------------------------------------------------------------Lsp Based Tools-------------------------------------------------------------------------------------

-- diagflow
-- LSP diagnostics in virtual text at the top right of your screen.
Tools["dgagn/diagflow.nvim"] = {
    event = "LspAttach",
    opts = {},
    config = require "tools.diagflow",
}

-- trouble
Tools["folke/trouble.nvim"] = {
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    config = require "tools.trouble",
}

-- Tools["SmiteshP/nvim-navic"] = {
--     dependencies = { "neovim/nvim-lspconfig" },
-- }

--------------------------------------------------------------------------------------------Quick Edit----------------------------------------------------------------------------------------

-- nvim-surround
-- Add/change/delete surrounding delimiter pairs with ease.
Tools["kylechui/nvim-surround"] = {
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
}

------------------------------------------------------------------------------------------Search & Replace------------------------------------------------------------------------------------

-- nvim-spectre
-- Tools["nvim-pack/nvim-spectre"] = {
--     build = false,
--     cmd = "Spectre",
--     opts = { open_cmd = "noswapfile vnew" },
--   -- stylua: ignore
--   keys = {
--     { "<leader>sr", function() require("spectre").open() end, desc = "Replace in Files (Spectre)" },
--   },
-- }

-- inc_rename
Tools["smjonas/inc-rename.nvim"] = {
    cmd = "IncRename",
    config = function()
        require("inc_rename").setup {}
    end,
}

-- grug-far
Tools["MagicDuck/grug-far.nvim"] = {
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
}

----------------------------------------------------------------------------------------Generator-------------------------------------------------------------------------------------------

-- neogen:
-- A better annotation generator. Supports multiple languages and annotation conventions.
Tools["danymat/neogen"] = {
    cmd = "Neogen",
    config = function()
        require("neogen").setup { snippet_engine = "luasnip" }
    end,
    -- stylua: ignore
    keys = {
        { "<leader>cn", function() require("neogen").generate() end, desc = "Generate Annotations (Neogen)", },
    },
}

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- toggleterm
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

-- harpoon
-- Tools["ThePrimeagen/harpoon"] = {
--     event = "VeryLazy",
--     lazy = true,
--     branch = "harpoon2",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     config = require "tools.harpoon",
-- }

return Tools
