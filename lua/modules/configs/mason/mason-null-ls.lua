local settings = require("global.settings")
local M = {}

M.setup = function()
	require("mason-null-ls").setup({
		ensure_installed = settings.null_ls_deps,
		automatic_installation = false,
		automatic_setup = true,
		handlers = {},
	})
end

return M
