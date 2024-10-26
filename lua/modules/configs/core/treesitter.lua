return function()
    local settings = require "global.settings"
    local treesitter = require "nvim-treesitter.configs"

    treesitter.setup {
        -- enable syntax highlighting
        highlight = {
            enable = true,
            -- use_languagetree = true,
            additional_vim_regex_highlighting = false,
            -- disable = function(lang, buf)
            --   local max_filesize = 100 * 1024 -- 100 KB
            --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            --   if ok and stats and stats.size > max_filesize then
            --     return true
            --   end
            -- end,
            disable = function(ft, bufnr)
                if
                    vim.tbl_contains({ "gitcommit" }, ft)
                    or (vim.api.nvim_buf_line_count(bufnr) > 7500 and ft ~= "vimdoc")
                then
                    return true
                end

                local ok, is_large_file = pcall(vim.api.nvim_buf_get_var, bufnr, "bigfile_disable_treesitter")
                return ok and is_large_file
            end,
        },
        matchup = {
            enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        -- autotag = {
        --   enable = true,
        -- },
        -- ensure these language parsers are installed
        ensure_installed = settings.treesitter_deps,

        incremental_selection = {
            enable = true,
            keymaps = {
                -- init_selection = "<C-space>",
                -- node_incremental = "<C-space>",
                -- scope_incremental = false,
                -- node_decremental = "<bs>",

                init_selection = "+",
                node_incremental = "+",
                node_decremental = "-",
                -- scope_incremental = '+',
            },
        },
        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["as"] = { query = "@scope", query_group = "locals" },
                    ["az"] = { query = "@fold", query_group = "folds" },
                    ["ai"] = "@call.outer",
                    ["ii"] = "@call.inner",
                    ["ad"] = "@conditional.outer",
                    ["id"] = "@conditional.inner",
                    ["ae"] = "@loop.outer",
                    ["ie"] = "@loop.inner",
                    ["ap"] = "@parameter.outer",
                    ["ip"] = "@parameter.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    ["at"] = "@comment.outer",
                    ["it"] = "@comment.inner",
                    ["ar"] = "@return.outer",
                    ["ir"] = "@return.inner",
                    ["al"] = "@statement.outer",
                    ["il"] = "@statement.inner",
                    ["an"] = "@number.outer",
                    ["in"] = "@number.inner",
                    ["ah"] = "@assignment.outer",
                    ["ih"] = "@assignment.inner",
                },
                -- You can choose the select mode (default is charwise 'v')
                --
                -- Can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * method: eg 'v' or 'o'
                -- and should return the mode ('v', 'V', or '<c-v>') or a table
                -- mapping query_strings to modes.
                selection_modes = {
                    ["@parameter.outer"] = "v", -- charwise
                    ["@function.outer"] = "V", -- linewise
                    ["@statement.outer"] = "V", -- linewise
                    ["@assignment.outer"] = "V", -- linewise
                    ["@block.outer"] = "V", -- linewise
                    ["@loop.outer"] = "V", -- linewise
                    ["@conditional.outer"] = "V", -- linewise
                    ["@class.outer"] = "V", -- linewise
                },
                -- If you set this to `true` (default is `false`) then any textobject is
                -- extended to include preceding or succeeding whitespace. Succeeding
                -- whitespace has priority in order to act similarly to eg the built-in
                -- `ap`.
                --
                -- Can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * selection_mode: eg 'v'
                -- and should return true of false
                include_surrounding_whitespace = false,
            },
            swap = {
                enable = true,
                swap_next = {
                    ["ml"] = "@parameter.inner",
                    ["mj"] = "@statement.outer",
                    ["mip"] = "@parameter.inner",
                    ["mib"] = "@block.outer",
                    ["mil"] = "@statement.outer",
                    ["mif"] = "@function.outer",
                    ["mic"] = "@class.outer",
                    ["min"] = "@number.inner",
                },
                swap_previous = {
                    ["mh"] = "@parameter.inner",
                    ["mk"] = "@statement.outer",
                    ["map"] = "@parameter.inner",
                    ["mab"] = "@block.outer",
                    ["mal"] = "@statement.outer",
                    ["maf"] = "@function.outer",
                    ["mac"] = "@class.outer",
                    ["man"] = "@number.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@class.outer",
                    ["]s"] = { query_group = "locals", query = "@scope" },
                    ["]z"] = { query = "@fold", query_group = "folds" },
                    ["]i"] = "@call.*",
                    ["]d"] = "@conditional.*",
                    ["]o"] = "@loop.*",
                    ["]p"] = "@parameter.inner",
                    ["]b"] = "@block.outer",
                    ["]t"] = "@comment.*",
                    ["]r"] = "@return.inner",
                    ["]l"] = "@statement.*",
                    ["]n"] = "@number.*",
                    ["]h"] = "@assignment.outer",
                },
                goto_next_end = {
                    ["]F"] = "@function.outer",
                    ["]C"] = "@class.outer",
                    ["]S"] = { query = "@scope", query_group = "locals" },
                    ["]Z"] = { query = "@fold", query_group = "folds" },
                    ["]I"] = "@call.*",
                    ["]D"] = "@conditional.*",
                    ["]E"] = "@loop.*",
                    ["]P"] = "@parameter.inner",
                    ["]B"] = "@block.outer",
                    ["]T"] = "@comment.*",
                    ["]R"] = "@return.inner",
                    ["]L"] = "@statement.*",
                    ["]N"] = "@number.*",
                    ["]H"] = "@assignment.outer",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                    ["[s"] = { query = "@scope", query_group = "locals" },
                    ["[z"] = { query = "@fold", query_group = "folds" },
                    ["[i"] = "@call.*",
                    ["[d"] = "@conditional.*",
                    ["[e"] = "@loop.*",
                    ["[p"] = "@parameter.inner",
                    ["[b"] = "@block.outer",
                    ["[t"] = "@comment.*",
                    ["[r"] = "@return.inner",
                    ["[l"] = "@statement.*",
                    ["[n"] = "@number.*",
                    ["[h"] = "@assignment.outer",
                },
                goto_previous_end = {
                    ["[F"] = "@function.outer",
                    ["[C"] = "@class.outer",
                    ["[S"] = { query = "@scope", query_group = "locals" },
                    ["[Z"] = { query = "@fold", query_group = "folds" },
                    ["[I"] = "@call.*",
                    ["[D"] = "@conditional.*",
                    ["[E"] = "@loop.*",
                    ["[P"] = "@parameter.*",
                    ["[B"] = "@block.outer",
                    ["[T"] = "@comment.*",
                    ["[R"] = "@return.inner",
                    ["[L"] = "@statement.*",
                    ["[N"] = "@number.*",
                    ["[H"] = "@assignment.outer",
                },
                -- Below will go to either the start or the end, whichever is closer.
                -- Use if you want more granular movements
                -- Make it even more gradual by adding multiple queries and regex.
                -- goto_next = {
                --     ["]d"] = "@conditional.outer",
                -- },
                -- goto_previous = {
                --     ["[d"] = "@conditional.outer",
                -- }
            },
            lsp_interop = {
                enable = true,
                border = "none",
                floating_preview_opts = {},
                peek_definition_code = {
                    ["gsf"] = "@function.outer",
                    ["gsc"] = "@class.outer",
                },
            },
        },
        modules = {},
        auto_install = false,
        sync_install = false,
        ignore_install = {},
        -- parser_install_dir = vim.fn.stdpath "cache" .. "/treesitter",
    }

    -- prefer git parsers
    require("nvim-treesitter.install").prefer_git = true
end
