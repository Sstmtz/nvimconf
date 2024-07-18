local Code = {}

Code["nvimdev/lspsaga.nvim"] = {
	event = "LspAttach",
	ft = { "c", "cpp", "lua", "rust", "go", "python", "java", "typescript", "javascript" },
	config = require("code.lspsaga"),
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
}

Code["Jint-lzxy/lsp_signature.nvim"] = {
	config = require("code.lsp-signature"),
}

return Code
