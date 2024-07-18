local Core = {}

Core["nvim-treesitter/nvim-treesitter"] = {
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	config = require("core.treesitter"),
}

Core["nvim-telescope/telescope.nvim"] = {
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	cmd = "Telescope",
	opts = function()
		return require("core.telescope")
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)

		-- load extensions
		for _, ext in ipairs(opts.extensions_list) do
			telescope.load_extension(ext)
		end
	end,
}

Core["nvim-tree/nvim-tree.lua"] = {
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	opts = function()
		return require("core.nvim-tree")
	end,
	config = function(_, opts)
		require("nvim-tree").setup(opts)
	end,
}

Core["neovim/nvim-lspconfig"] = {
	event = { "CursorHold", "CursorHoldI" },
	config = require("core.lspconfig"),
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "folke/neoconf.nvim" },
	},
}

Core["stevearc/conform.nvim"] = {
	event = "BufWritePre", -- uncomment for format on save
	config = require("core.conform"),
}

Core["mfussenegger/nvim-lint"] = {
	event = { "BufReadPre", "BufNewFile" },
	config = require("core.nvim-lint"),
}

Core["nvimtools/none-ls.nvim"] = {
	event = { "CursorHold", "CursorHoldI" },
	config = require("core.null-ls"),
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
}

Core["hrsh7th/nvim-cmp"] = {
	event = "InsertEnter",
	dependencies = {
		{
			-- snippet plugin
			"L3MON4D3/LuaSnip",
			build = vim.fn.has("win32") ~= 0 and "make install_jsregexp" or nil,
			dependencies = { "rafamadriz/friendly-snippets", "benfowler/telescope-luasnip.nvim" },
			opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			config = function(_, opts)
				if opts then
					require("luasnip").config.setup(opts)
				end
				vim.tbl_map(function(type)
					require("luasnip.loaders.from_" .. type).lazy_load()
				end, { "vscode", "snipmate", "lua" })
				-- friendly-snippets - enable standardized comments snippets
				require("luasnip").filetype_extend("typescript", { "tsdoc" })
				require("luasnip").filetype_extend("javascript", { "jsdoc" })
				require("luasnip").filetype_extend("lua", { "luadoc" })
				require("luasnip").filetype_extend("python", { "pydoc" })
				require("luasnip").filetype_extend("rust", { "rustdoc" })
				require("luasnip").filetype_extend("cs", { "csharpdoc" })
				require("luasnip").filetype_extend("java", { "javadoc" })
				require("luasnip").filetype_extend("c", { "cdoc" })
				require("luasnip").filetype_extend("cpp", { "cppdoc" })
				require("luasnip").filetype_extend("php", { "phpdoc" })
				require("luasnip").filetype_extend("kotlin", { "kdoc" })
				require("luasnip").filetype_extend("ruby", { "rdoc" })
				require("luasnip").filetype_extend("sh", { "shelldoc" })

				require("luasnip").config.set_config(opts)
				require("core.luasnip")
			end,
		},
		-- autopairing of (){}[] etc
		{
			"windwp/nvim-autopairs",
			opts = {
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
			},
			config = function(_, opts)
				require("nvim-autopairs").setup(opts)

				-- setup cmp for autopairs
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end,
		},
		-- cmp sources plugins
		{
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},
	opts = function()
		return require("core.cmp")
	end,
	config = function(_, opts)
		require("cmp").setup(opts)
	end,
}

Core["mfussenegger/nvim-dap"] = {
	cmd = {
		"DapSetLogLevel",
		"DapShowLog",
		"DapContinue",
		"DapToggleBreakpoint",
		"DapToggleRepl",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapTerminate",
	},
	config = require("core.dap"),
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = require("code.dap.dapui"),
			dependencies = {
				"nvim-neotest/nvim-nio",
			},
		},
		{ "jay-babu/mason-nvim-dap.nvim" },
	},
}

Core["echasnovski/mini.nvim"] = {
	version = false,
}

return Core
