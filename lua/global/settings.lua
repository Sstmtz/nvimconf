local settings = {}

---@type boolean
settings["use_ssh"] = false

---@type boolean
settings["use_copilot"] = false

---@type boolean
settings["enable_nvchad"] = true

-- Set it to true if your terminal has transparent background.
---@type boolean
settings["transparent_background"] = false

-- Set format on save
---@type boolean
settings["format_on_save"] = true

-- Set format timeout (in ms).
---@type number
settings["format_timeout"] = 1000

-- Set diagnostic virtual text
-- Set false if you use other virtual text plugins. e.g. lspsaga, navigatior
---@type boolean
settings["diagnostics_virtual_text"] = false

-- Set diagnostic level
---@type "ERROR"|"WARN"|"INFO"|"HINT"
settings["diagnostics_level"] = "HINT"

---@type "neo-tree" | "nvim-tree"
settings["file_tree"] = "nvim-tree"

---@type "nvchad" | "catppuccin"
settings["colorscheme"] = "nvchad"

-- [lazy] automatically check for plugin updates
---@type table
settings["lazy_checker"] = {
  enabled = false,
  concurrency = nil, ---@type number? set to 1 to check for updates very slowly
  notify = true, -- get a notification when new updates are found
  frequency = 3600, -- check for updates every hour
  check_pinned = false, -- check for pinned packages that can't be updated
}

-- [lazy] diabaled plugins
---@type string[]
settings["disabled_plugins"] = {
  "stevearc/aerial.nvim",
  "ray-x/navigator.lua",
}

-- [Nvchad] nvdash startup options
---@type boolean
settings["load_on_startup"] = false

---@type palette[]
settings["palette_overwrite"] = {}

-- Set it to false if you don't use nvim to open big files.
---@type boolean
settings["load_big_files_faster"] = true

---@type string[]
settings["dap_deps"] = {
  "codelldb", -- C/C++/Rust
  "delve", -- Go
  "python", -- Python (debugpy)
  "js", -- JavaScript
}

---@type string[]
settings["lsp_deps"] = {
  "bashls", -- sh lsp
  "texlab", -- latex lsp
  -- "awk_ls", -- awk lsp
  -- "matlab_ls", -- matlab lsp
  ----------------------------------------
  "lua_ls", -- lua lsp
  "clangd", -- c/c++ lsp
  "pylsp", -- python lsp
  "ruff", -- python lsp
  "gopls", -- go lsp
  "csharp_ls", -- c# lsp
  "cmake", -- cmake lsp
  "dockerls", -- docker lsp
  -- "jdtls", -- java lsp
  -- "java_language_server", -- java lsp
  -- "rust-analyzer", -- rust lsp
  -----------------------------------------
  "html", -- html lsp
  "cssls", -- css lsp
  "tsserver", -- javascript/typescript lsp
  "volar", -- vue lsp
  -- "htmx", -- html lsp
  -----------------------------------------
  "jsonls", -- json lsp
  "yamlls", -- yaml lsp
  "taplo", -- toml lsp
  "lemminx", -- xml lsp
  ----------------------------------------
  -- "vuels", -- vue lsp
  -- "emmet_ls", -- emmet_ls lsp
  -- "svelte", -- svelte lsp
  -- "graphql", -- graphQL lsp
}

---@type string[]
settings["null_ls_deps"] = {
  "clang_format",
  "gofumpt",
  "goimports",
  "gomodifytags",
  "impl",
  "prettier",
  "shfmt",
  "stylua",
  "vint",
  "isort",
  "block",
  "java_debug_adapter",
  "java_test",
  "markdownlint-cli2",
  "markdown-toc",
}

---@type string[]
settings["treesitter_deps"] = {
  "vim",
  "vimdoc",
  "printf",
  "bash",
  -- C/C++
  "c",
  "cpp",
  "cmake",
  -- Go
  "go",
  "gomod",
  "gowork",
  "gosum",
  -- Python
  "python",
  "ninja",
  "rst",
  -- Rust
  "rust",
  "ron",
  "java",
  "html",
  "css",
  "json5",
  "latex",
  "lua",
  "luadoc",
  "make",
  "markdown",
  "markdown_inline",
  "vue",
  "javascript",
  "typescript",
  "yaml",
  -- Git
  "git_config",
  "gitcommit",
  "git_rebase",
  "gitignore",
  "gitattributes",
}

---@type string[]
settings["dashboard_image"] = {
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣡⣾⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣟⠻⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⡿⢫⣷⣿⣿⣿⣿⣿⣿⣿⣾⣯⣿⡿⢧⡚⢷⣌⣽⣿⣿⣿⣿⣿⣶⡌⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣇⣘⠿⢹⣿⣿⣿⣿⣿⣻⢿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣻⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⡇⠀⣬⠏⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⠀⠈⠁⠀⣿⡇⠘⡟⣿⣿⣿⣿⣿⣿⣿⣿⡏⠿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⡏⠀⠀⠐⠀⢻⣇⠀⠀⠹⣿⣿⣿⣿⣿⣿⣩⡶⠼⠟⠻⠞⣿⡈⠻⣟⢻⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢿⠀⡆⠀⠘⢿⢻⡿⣿⣧⣷⢣⣶⡃⢀⣾⡆⡋⣧⠙⢿⣿⣿⣟⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⡥⠂⡐⠀⠁⠑⣾⣿⣿⣾⣿⣿⣿⡿⣷⣷⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⡿⣿⣍⡴⠆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣄⣀⣷⡄⣙⢿⣿⣿⣿⣿⣯⣶⣿⣿⢟⣾⣿⣿⢡⣿⣿⣿⣿⣿]],
  [[⣿⡏⣾⣿⣿⣿⣷⣦⠀⠀⠀⢀⡀⠀⠀⠠⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣡⣾⣿⣿⢏⣾⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⡴⠀⠀⠀⠀⠀⠠⠀⠰⣿⣿⣿⣷⣿⠿⠿⣿⣿⣭⡶⣫⠔⢻⢿⢇⣾⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⡿⢫⣽⠟⣋⠀⠀⠀⠀⣶⣦⠀⠀⠀⠈⠻⣿⣿⣿⣾⣿⣿⣿⣿⡿⣣⣿⣿⢸⣾⣿⣿⣿⣿⣿⣿⣿]],
  [[⡿⠛⣹⣶⣶⣶⣾⣿⣷⣦⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⡿⠫⠾⠿⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⡆⣠⢀⣴⣏⡀⠀⠀⠀⠉⠀⠀⢀⣠⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⠿⠛⠛⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣯⣟⠷⢷⣿⡿⠋⠀⠀⠀⠀⣵⡀⢠⡿⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⢿⣿⣿⠂⠀⠀⠀⠀⠀⢀⣽⣿⣿⣿⣿⣿⣿⣿⣍⠛⠿⣿⣿⣿⣿⣿⣿]],
}

return settings
