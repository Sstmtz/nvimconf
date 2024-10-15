local Code = {}

-- lspsaga
Code["nvimdev/lspsaga.nvim"] = {
    event = "LspAttach",
    ft = { "c", "cpp", "lua", "rust", "go", "python", "java", "typescript", "javascript" },
    config = require "code.lspsaga",
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- optional
        "nvim-tree/nvim-web-devicons", -- optional
    },
}

-- lsp_signature
Code["ray-x/lsp_signature.nvim"] = {
    config = require "code.lsp-signature",
}

-- glance
Code["dnlhc/glance.nvim"] = {
    event = "LspAttach",
    config = require "code.glance",
}

-- crates
Code["Saecki/crates.nvim"] = {
    event = "BufReadPost Cargo.toml",
    ft = { "toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        completion = {
            cmp = { enabled = true },
        },
    },
    config = require "code.crates",
}

-- rustaceanvim
Code["mrcjkb/rustaceanvim"] = {
    version = "^4",
    lazy = false,
    ft = { "rust" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require "code.rustaceanvim",
}

-- refactoring
Code["ThePrimeagen/refactoring.nvim"] = {
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
}

-- clangd_extensions
Code["p00f/clangd_extensions.nvim"] = {
    config = require "code.clangd_extensions",
}

-- neotest
Code["nvim-neotest/neotest"] = {
    config = require "code.neotest",
    dependencies = {
        "fredrikaverpil/neotest-golang",
        "nvim-neotest/neotest-python",
    },
  -- stylua: ignore
  keys = {
    {"<leader>t", "", desc = "+test"},
    { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
    { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files" },
    { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
    { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
    { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch" },
  },
}

-- SchemaStore
Code["b0o/SchemaStore.nvim"] = {
    lazy = true,
    version = false, -- last release is way too old
}

-- venv-selector
Code["linux-cultist/venv-selector.nvim"] = {
    branch = "regexp", -- Use this branch for the new version
    cmd = "VenvSelect",
    enabled = true,
    opts = {
        settings = {
            options = {
                notify_user_on_venv_activation = true,
            },
        },
    },
    --  Call config for python files and load the cached venv automatically
    ft = "python",
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
}

-- sniprun
Code["michaelb/sniprun"] = {
    branch = "master",
    build = "sh install.sh",
    config = function()
        require("sniprun").setup {}
    end,
}

-- navigator
Code["ray-x/navigator.lua"] = {
    dependencies = {
        { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
    },
    config = require "code.navigator",
}

-- dropbar
Code["Bekaboo/dropbar.nvim"] = {
    -- optional, but required for fuzzy finder support
    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
    },
}

return Code
