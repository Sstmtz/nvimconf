local M = {}

---@param config {args?:string[]|fun():string[]?}
function M.get_args(config)
    local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
    config = vim.deepcopy(config)
    ---@cast args string[]
    config.args = function()
        local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
        return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
    end
    return config
end

function M.input_args()
    local argument_string = vim.fn.input "Program arg(s) (enter nothing to leave it null): "
    return vim.fn.split(argument_string, " ", true)
end

function M.input_exec_path()
    return vim.fn.input('Path to executable (default to "a.out"): ', vim.fn.expand "%:p:h" .. "/a.out", "file")
end

function M.input_file_path()
    return vim.fn.input("Path to debuggee (default to the current file): ", vim.fn.expand "%:p", "file")
end

function M.get_env()
    local variables = {}
    for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
    end
    return variables
end

return setmetatable({}, {
    __index = function(_, key)
        return function()
            return function()
                return M[key]()
            end
        end
    end,
})
