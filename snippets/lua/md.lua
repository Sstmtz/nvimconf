local ls = require "luasnip"
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function()
    return { os.date "%Y-%m-%d" }
end

ls.add_snippets("markdown", {
    snip({
        trig = "meta",
        namr = "Metadata",
        dscr = "Yaml metadata format for markdown",
    }, {
        text { "---", "title: " },
        insert(1, "note_title"),
        text { "", "author: " },
        insert(2, "author"),
        text { "", "date: " },
        func(date, {}),
        text { "", "cathegories: [" },
        insert(3, ""),
        text { "]", "lastmod: " },
        func(date, {}),
        text { "", "tags: [" },
        insert(4),
        text { "]", "comments: true", "---", "" },
        insert(0),
    }),
})
