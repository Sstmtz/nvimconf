local ls = require "luasnip"
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local extras = require "luasnip.extras"
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

-- 按A-n进行循环枚举选择
vim.keymap.set({ "i", "s" }, "<A-n>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

ls.add_snippets("cs", {
    snip(
        "logc",
        fmt([[Debug.Log($"<color={}>{}</color>");]], {
            choice(1, {
                text "red",
                text "green",
                text "blue",
                text "cyan",
                text "magenta",
            }),
            insert(2),
        })
    ),
})
