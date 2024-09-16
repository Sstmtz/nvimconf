local ls = require "luasnip"
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local filename = function()
    return { vim.fn.expand "%:p" }
end

local function bash(_, _, command)
    local file = io.popen(command, "r")
    local res = {}
    for line in file:lines() do
        table.insert(res, line)
    end
    return res
end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "filename",
            namr = "Filename",
            dscr = "Absolute path to file",
        }, {
            func(filename, {}),
        }),
        snip({
            trig = "pwd",
            namr = "PWD",
            dscr = "Path to current working directory",
        }, {
            func(bash, {}, { user_args = { "pwd" } }),
        }),
    },
    sh = {
        snip("shebang", {
            text { "#!/bin/sh", "" },
            insert(0),
        }),
    },
    python = {
        snip("shebang", {
            text { "#!/usr/bin/env python", "" },
            insert(0),
        }),
    },
    lua = {
        snip("shebang", {
            text { "#!/usr/bin/lua", "", "" },
            insert(0),
        }),
    },
})
