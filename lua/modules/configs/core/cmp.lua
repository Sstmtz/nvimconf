local cmp = require "cmp"
local settings = require "global.settings"

if settings.enable_nvchad then
    dofile(vim.g.base46_cache .. "cmp")
    local options = {

        completion = {
            completeopt = "menu,menuone,noinsert,noselect",
        },
        matching = {
            disallow_partial_fuzzy_matching = false,
        },
        performance = {
            async_budget = 1,
            max_view_entries = 120,
        },
        auto_brackets = {
            "python",
        },
        formatting = {
            format = {
                maxwidth = 50,
            },
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        sources = {
            -- { name = "lazydev", group_index = 0 },
            { name = "nvim_lsp", max_item_count = 10 },
            {
                name = "buffer",
                max_item_count = 8,
                -- keyword_length = 2,
                -- option = {
                --     get_bufnrs = function()
                --         return vim.api.nvim_buf_line_count(0) < 7500 and vim.api.nvim_list_bufs() or {}
                --     end,
                -- },
            },
            { name = "rg", max_item_count = 5, keyword_length = 4 },
            { name = "luasnip", max_item_count = 8 },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "crates" },
            -- { name = "git", max_item_count = 5, keyword_length = 2 },
            {
                name = "codeium",
                -- group_index = 2,
                -- priority = 100,
            },
            -- { name = "nvim_lsp_signature_help" },
            -- { name = "copilot" }, -- copilot source
            -- {
            --   name = "cmp_tabnine",
            --   group_index = 2,
            --   priority = 100,
            -- },
        },
        sorting = {
            comparators = {
                -- require "clangd_extensions.cmp_scores",
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.recently_used,
                require("cmp-under-comparator").under,
                -- require("cmp_tabnine.compare"), -- INFO: uncomment this for AI completion
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),

            ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },

            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(
                        vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                        ""
                    )
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                    fallback()
                end
            end, { "i", "s" }),
        },
    }

    -- return options
    return vim.tbl_deep_extend("force", options, require "nvchad.cmp")
else
    -- TODO: Add cmp config
    local options = {}
    return options
end
