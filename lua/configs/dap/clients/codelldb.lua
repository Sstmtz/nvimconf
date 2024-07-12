local dap = require "dap"
local utils = require "utils.dap"

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.exepath "codelldb", -- Find codelldb on $PATH
    args = { "--port", "${port}" },
    detached = true,
  },
}

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" },
}

dap.configurations.cpp = {
  {
    name = "Debug",
    type = "codelldb",
    request = "launch",
    program = utils.input_exec_path(),
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    terminal = "integrated",
  },
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Debug (with args)",
    type = "codelldb",
    request = "launch",
    program = utils.input_exec_path(),
    args = utils.input_args(),
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    terminal = "integrated",
  },
  {
    name = "Attach to a running process",
    type = "codelldb",
    request = "attach",
    program = utils.input_exec_path(),
    stopOnEntry = false,
    waitFor = true,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
