-- -- vscode format
-- require("luasnip.loaders.from_vscode").lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
-- require("luasnip.loaders.from_vscode").lazy_load { paths = { vim.g.vscode_snippets_path or "" } }
-- -- require("luasnip.loaders.from_vscode").load_standalone { path = "~/.config/nvim/snippets/vscode/c.code-snippets" }
--
-- -- snipmate format
-- require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }
-- -- require("luasnip.loaders.from_snipmate").load { paths = "~/.config/nvim/snippets/snipmate" }
--
-- -- lua format
-- require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

return function()
    -- enable friendly-snippets
    vim.tbl_map(function(type)
        require("luasnip.loaders.from_" .. type).lazy_load()
    end, { "vscode", "snipmate", "lua" })

    -- friendly-snippets - enable standardized comments snippets
    require("luasnip").filetype_extend("typescript", { "tsdoc" })
    require("luasnip").filetype_extend("javascript", { "jsdoc" })
    require("luasnip").filetype_extend("lua", { "luadoc" })
    require("luasnip").filetype_extend("python", { "pydoc" })
    require("luasnip").filetype_extend("rust", { "rustdoc" })
    require("luasnip").filetype_extend("cs", { "csharpdoc" })
    require("luasnip").filetype_extend("java", { "javadoc" })
    require("luasnip").filetype_extend("c", { "cdoc" })
    require("luasnip").filetype_extend("cpp", { "cppdoc" })
    require("luasnip").filetype_extend("php", { "phpdoc" })
    require("luasnip").filetype_extend("kotlin", { "kdoc" })
    require("luasnip").filetype_extend("ruby", { "rdoc" })
    require("luasnip").filetype_extend("sh", { "shelldoc" })

    -- autocmd
    vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
            if
                require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                and not require("luasnip").session.jump_active
            then
                require("luasnip").unlink_current()
            end
        end,
    })
end
