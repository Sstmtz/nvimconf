local UI = {}

UI["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}

UI["nvim-tree/nvim-web-devicons"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	opts = {},
	config = function(_, opts)
		require("nvim-web-devicons").setup(opts)
	end,
}

UI["folke/noice.nvim"] = {
	event = "VeryLazy",
	opts = {},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
		"nvim-treesitter/nvim-treesitter",
	},
	config = require("ui.noice"),
}

UI["lukas-reineke/indent-blankline.nvim"] = {
	event = "User FilePost",
	config = require("ui.indent-blankline"),
}

UI["folke/todo-comments.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.todo"),
	dependencies = { "nvim-lua/plenary.nvim" },
}

UI["stevearc/dressing.nvim"] = {
	event = "VeryLazy",
}

UI["stevearc/aerial.nvim"] = {
	event = "VeryLazy",
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = require("ui.aerial"),
}

UI["onsails/lspkind.nvim"] = {
	config = require("ui.lspkind"),
}

return UI
