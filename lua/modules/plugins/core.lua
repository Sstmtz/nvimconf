local Core = {}
local dap = require "modules.utils.dap"
local settings = require "global.settings"

-- treesitter
Core["nvim-treesitter/nvim-treesitter"] = {
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = function()
        if #vim.api.nvim_list_uis() > 0 then
            vim.api.nvim_command [[TSUpdate]]
        end
    end,
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    config = require "core.treesitter",
}

-- telescope
Core["nvim-telescope/telescope.nvim"] = {
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
        return require "core.telescope"
    end,
    config = function(_, opts)
        local telescope = require "telescope"
        telescope.setup(opts)

        -- load extensions
        for _, ext in ipairs(opts.extensions_list) do
            telescope.load_extension(ext)
        end
    end,
}

-- which-key
Core["folke/which-key.nvim"] = {
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    opts_extend = { "spec" },
    opts = {
        spec = {
            { "<leader>o", group = "overseer" },
        },
    },
    config = require "core.which-key",
}

-- nvim-tree
Core["nvim-tree/nvim-tree.lua"] = {
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
        return require "core.nvim-tree"
    end,
    config = function(_, opts)
        require("nvim-tree").setup(opts)
    end,
    enabled = settings.file_tree == "nvim-tree",
}

-- neo-tree
Core["nvim-neo-tree/neo-tree.nvim"] = {
    cmd = "Neotree",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = require "core.neo-tree",
    enable = settings.file_tree == "neo-tree",
}

-- nvim-lspconfig
Core["neovim/nvim-lspconfig"] = {
    event = { "CursorHold", "CursorHoldI" },
    config = require "core.lspconfig",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "folke/neoconf.nvim", cmd = "Neoconf" },
    },
    opts = {
        setup = {
            clangd = function(_, opts)
                local clangd_ext_opts = require "code.clangd_extensions"
                require("clangd_extensions").setup(
                    vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts })
                )
                return false
            end,
        },
    },
}

-- conform
Core["stevearc/conform.nvim"] = {
    event = "BufWritePre", -- uncomment for format on save
    config = require "core.conform",
    dependencies = { "williamboman/mason.nvim" },
    cmd = "ConformInfo",
}

-- nvim-lint
Core["mfussenegger/nvim-lint"] = {
    -- events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    opts = {
        events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    },
    config = require "core.nvim-lint",
}

-- none-ls
Core["nvimtools/none-ls.nvim"] = {
    event = { "BufReadPre", "BufNewFile" },
    config = require "core.null-ls",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "jay-babu/mason-null-ls.nvim",
        "nvimtools/none-ls-extras.nvim",
    },
}

-- nvim-cmp
Core["hrsh7th/nvim-cmp"] = {
    event = "InsertEnter",
    enabled = settings.completion_system == "nvim-cmp",
    dependencies = {
        -- snippet plugin
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*",
            event = "InsertEnter",
            build = "make install_jsregexp",
            dependencies = {
                "rafamadriz/friendly-snippets",
                "benfowler/telescope-luasnip.nvim",
            },
            opts = { history = true, updateevents = "TextChanged,TextChangedI" },
            config = require "core.luasnip",
        },
        -- autopairing of (){}[] etc
        {
            "windwp/nvim-autopairs",
            opts = {
                fast_wrap = {},
                disable_filetype = { "TelescopePrompt", "vim" },
            },
            config = function(_, opts)
                require("nvim-autopairs").setup(opts)

                -- setup cmp for autopairs
                local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                -- disable guihua for autocomplete
                -- if vim.o.ft == "clap_input" and vim.o.ft == "guihua" and vim.o.ft == "guihua_rust" then
                --   require("cmp").setup.buffer { completion = { enable = false } }
                -- end
            end,
        },
        -- cmp sources plugins
        {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "petertriho/cmp-git",
            "lukas-reineke/cmp-under-comparator",
            "lukas-reineke/cmp-rg",
            -- "hrsh7th/cmp-nvim-lsp-signature-help",
        },
    },
    opts = function()
        return require "core.cmp"
    end,
    -- config = function(_, opts)
    --     require("cmp").setup(opts)
    -- end,
}

-- cmp-tabnine
-- Core["tzachar/cmp-tabnine"] = {
--     after = "nvim-cmp",
--     build = { "./install.sh" },
--     -- dependencies = "hrsh7th/nvim-cmp",
--     opts = {
--         max_lines = 1000,
--         max_num_results = 3,
--         sort = true,
--     },
--     config = function(_, opts)
--         require("cmp_tabnine.config"):setup(opts)
--     end,
-- }

-- blickcmp
Core["saghen/blink.cmp"] = {
    -- lazy = false, -- lazy loading handled internally
    event = "InsertEnter",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    opts = require "core.blinkcmp",
    enabled = settings.completion_system == "blinkcmp",
}

-- nvim-dap
Core["mfussenegger/nvim-dap"] = {
    cmd = {
        "DapSetLogLevel",
        "DapShowLog",
        "DapContinue",
        "DapToggleBreakpoint",
        "DapToggleRepl",
        "DapStepOver",
        "DapStepInto",
        "DapStepOut",
        "DapTerminate",
    },
    recommended = true,
    opts = function()
        require("overseer").enable_dap() -- overseer integration
    end,
    config = require "core.dap",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            config = require "code.dap.dapui",
            -- stylua: ignore
            keys = {
                { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
                { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
            },
            dependencies = {
                "nvim-neotest/nvim-nio",
            },
        },
        {
            "mfussenegger/nvim-dap-python",
            -- stylua: ignore
            keys = {
                { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
                { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
            },
            config = function()
                require("dap-python").setup(
                    require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"
                )
            end,
        },
        "theHamsta/nvim-dap-virtual-text",
        "leoluz/nvim-dap-go",
    },
    -- stylua: ignore
    keys = {
        { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
        { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
        { "<leader>da", function() require("dap").continue({ before = dap.get_args }) end, desc = "Run with Args" },
        { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
        { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
        { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
        { "<leader>dj", function() require("dap").down() end, desc = "Down" },
        { "<leader>dk", function() require("dap").up() end, desc = "Up" },
        { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
        { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
        { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
        { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
        { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
        { "<leader>ds", function() require("dap").session() end, desc = "Session" },
        { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
        { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
}

-- mini
Core["echasnovski/mini.nvim"] = {
    version = false,
}

-- bigfile
Core["LunarVim/bigfile.nvim"] = {
    lazy = false,
    config = require "core.bigfile",
    cond = require("global.settings").load_big_files_faster,
}

return Core
