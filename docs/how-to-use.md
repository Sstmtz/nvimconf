## 🛠️ Plugins Manager

Here are two options for you to choose from.

- lazy (default): [lazy.nvim](https://github.com/folke/lazy.nvim)
- rocks: [rocks.nvim](https://github.com/nvim-neorocks/rocks.nvim)

**At present, I recommend using `lazy.nvim`, which is popular and easy to configure, and most of my configurations are based on the lazy setup.**

`rocks.nvim` is a plugin manager for Neovim that integrates directly with luarocks, which means it can handle dependencies and build steps for plugins, shifting the responsibility from the user to the plugin authors. **However, since many plugins are not yet available on luarocks, it is currently not recommended to switch to rocks.nvim for downloading and managing plugins.**

if you want to use `rocks.nvim`, you only need to set the `'packer'` setting to `rocks`.

```lua
-- the config file is in "~/.config/nvim/lua/global/settings.lua"
settings["packer"] = "rocks" -- default is "lazy"
```

---

## 🌈 Themes

The default theme provided by the [NvChad](https://github.com/NvChad/NvChad) plugin offers a variety of predefined theme configurations.
If you do not like it and want to customize it, you need to disable it first and then configure a custom theme through some related plugins (such as `lualine.nvim`).

```lua
-- the config file is in "~/.config/nvim/lua/global/settings.lua"
-- set false to disable NvChad
settings["enable_nvchad"] = false
```

---

## 📚 Configuration

When you want to install a plugin, you need to follow the steps.

1. Install the plugin(lua/modules/plugins/xxx.lua)
2. Configure the plugin(lua/modules/configs/xxx.lua)

```lua

-- Common config format:
{
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = require "core.null-ls",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "jay-babu/mason-null-ls.nvim",
        "nvimtools/none-ls-extras.nvim",
    },

}


-- We use the format:
local Core = {}  -- define an empty table

Core["nvimtools/none-ls.nvim"] = {
    event = { "BufReadPre", "BufNewFile" },
    -- config = require "lua/modules/configs/core/null-ls", -- the full path of the config file
    config = require "core.null-ls",                        -- Now, we can ignore this prefix: "~/.config/nvim/lua/moudles/configs/".
    dependencies = {
        "nvim-lua/plenary.nvim",
        "jay-babu/mason-null-ls.nvim",
        "nvimtools/none-ls-extras.nvim",
    },
}

return Core -- as a return table
```
