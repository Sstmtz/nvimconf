local settings = require "global.settings"
local AI = {}

-- copilot
AI["zbirenbaum/copilot.lua"] = {
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require "ai.copilot"
    end,
    dependencies = { { "zbirenbaum/copilot-cmp", config = require "ai.copilot-cmp" } },
    enabled = settings.use_copilot,
}

-- codeium
AI["Exafunction/codeium.vim"] = {
    event = "BufEnter",
    -- dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     "hrsh7th/nvim-cmp",
    -- },
}

-- CopilotChat
AI["CopilotC-Nvim/CopilotChat.nvim"] = {
    branch = "canary",
    dependencies = {
        { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
        debug = true, -- Enable debugging
        -- See Configuration section for rest
    },
    enabled = settings.use_copilot,
}

-- avante
AI["yetone/avante.nvim"] = {
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
        -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    enabled = settings.use_copilot,
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}

return AI
