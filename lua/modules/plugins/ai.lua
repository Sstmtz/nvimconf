local settings = require "global.settings"
local AI = {}

-- copilot
if settings.use_copliot then
  AI["zbirenbaum/copilot.lua"] = {
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require "tools.copilot"
    end,
    dependencies = { "zbirenbaum/copilot-cmp", config = require "ai.copilot-cmp" },
  }
end

-- codeium
AI["Exafunction/codeium.vim"] = {
  event = "BufEnter",
}

return AI
