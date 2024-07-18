local settings = require("global.settings")
local Tools = {}

Tools["kdheepak/lazygit.nvim"] = {
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- order to load the plugin when the command is run for the first time
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
	},
}

Tools["mikavilpas/yazi.nvim"] = {
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>-",
			function()
				require("yazi").yazi()
			end,
			desc = "Open the file manager",
		},
		{
			-- Open in the current working directory
			"<leader>cw",
			function()
				require("yazi").yazi(nil, vim.fn.getcwd())
			end,
			desc = "Open the file manager in nvim's working directory",
		},
	},
	opts = {
		yazi_floating_window_border = "rounded",
	},
}

Tools["ellisonleao/glow.nvim"] = {
	config = true,
	cmd = "Glow",
}

Tools["Civitasv/cmake-tools.nvim"] = {
	config = require("tools.cmake-tools"),
}

if settings.use_copliot then
	Tools["zbirenbaum/copilot.lua"] = {
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("tools.copilot")
		end,
		dependencies = { "zbirenbaum/copilot-cmp", config = require("tools.copilot-cmp") },
	}
end

Tools["Exafunction/codeium.vim"] = {
	event = "BufEnter",
}

Tools["mrjones2014/legendary.nvim"] = {
	-- since legendary.nvim handles all your keymaps/commands,
	-- its recommended to load legendary.nvim before other plugins
	priority = 10000,
	lazy = false,
	-- sqlite is only needed if you want to use frecency sorting
	-- dependencies = { 'kkharji/sqlite.lua' }
}

if not settings.enable_nvchad then
	Tools["akinsho/toggleterm.nvim"] = {
		lazy = true,
		cmd = {
			"ToggleTerm",
			"ToggleTermSetName",
			"ToggleTermToggleAll",
			"ToggleTermSendVisualLines",
			"ToggleTermSendCurrentLine",
			"ToggleTermSendVisualSelection",
		},
		config = require("tools.toggleterm"),
	}
end

Tools["folke/which-key.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("tools.which-key"),
}

Tools["kylechui/nvim-surround"] = {
	event = { "BufReadPre", "BufNewFile" },
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = true,
}

Tools["numToStr/Comment.nvim"] = {
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	keys = {
		{ "gcc", mode = "n", desc = "Comment toggle current line" },
		{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
		{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
		{ "gbc", mode = "n", desc = "Comment toggle current block" },
		{ "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
		{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
	},
	config = function()
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
		-- enable comment
		comment.setup({
			-- for commenting tsx, jsx, svelte, html files
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}

Tools["folke/trouble.nvim"] = {
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	config = require("tools.trouble"),
}

return Tools
