local neoscroll = require "neoscroll"

neoscroll.setup {
  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing = "sine",             -- Default easing function
  performance_mode = false,    -- Disable "Performance Mode" on all buffers.

  pre_hook = function(info)
    if info == "cursorline" then
      vim.wo.cursorline = false
    end
  end,
  post_hook = function(info)
    if info == "cursorline" then
      vim.wo.cursorline = true
    end
  end,
}

-- keymapings
local keymap = {
  ["<C-u>"] = function()
    neoscroll.ctrl_u { duration = 250, info = "cursorline" }
  end,
  ["<C-d>"] = function()
    neoscroll.ctrl_d { duration = 250, info = "cursorline" }
  end,
  ["<C-b>"] = function()
    neoscroll.ctrl_b { duration = 450 }
  end,
  ["<C-f>"] = function()
    neoscroll.ctrl_f { duration = 450 }
  end,
  ["<C-y>"] = function()
    neoscroll.scroll(-0.1, { move_cursor = true, duration = 100 })
  end,
  ["<C-e>"] = function()
    neoscroll.scroll(0.1, { move_cursor = true, duration = 100 })
  end,
  ["zt"] = function()
    neoscroll.zt { half_screen_duration = 250 }
  end,
  ["zz"] = function()
    neoscroll.zz { half_screen_duration = 250 }
  end,
  ["zb"] = function()
    neoscroll.zb { half_screen_duration = 250 }
  end,
  ["G"] = function()
    neoscroll.G { half_screen_duration = 250 }
  end,
  ["gg"] = function()
    neoscroll.gg { half_screen_duration = 250 }
  end,
}

local modes = { "n", "v", "x" }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end
