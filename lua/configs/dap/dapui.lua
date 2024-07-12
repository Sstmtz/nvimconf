local dap = require "dap"
local dapui = require "dapui"
require("dapui").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local icons = {
  ui = require("utils.icons").get "ui",
  dap = require("utils.icons").get "dap",
}

dapui.setup {
  expand_lines = true,
  select_window = nil,
  element_mappings = {},

  force_buffers = true,
  icons = {
    expanded = icons.ui.ArrowOpen,
    collapsed = icons.ui.ArrowClosed,
    current_frame = icons.ui.Indicator,
  },
  mappings = {
    -- Use a table to apply multiple mappings
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        -- Provide as ID strings or tables with "id" and "size" keys
        {
          id = "scopes",
          size = 0.3, -- Can be float or integer > 1
        },
        { id = "watches", size = 0.3 },
        { id = "stacks", size = 0.3 },
        { id = "breakpoints", size = 0.1 },
      },
      size = 0.3,
      position = "right",
    },
    {
      elements = {
        { id = "console", size = 0.55 },
        { id = "repl", size = 0.45 },
      },
      position = "bottom",
      size = 0.25,
    },
  },
  controls = {
    enabled = true,
    -- Display controls in this session
    element = "repl",
    icons = {
      pause = icons.dap.Pause,
      play = icons.dap.Play,
      step_into = icons.dap.StepInto,
      step_over = icons.dap.StepOver,
      step_out = icons.dap.StepOut,
      step_back = icons.dap.StepBack,
      run_last = icons.dap.RunLast,
      terminate = icons.dap.Terminate,
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  render = { indent = 1, max_value_lines = 85 },
}
