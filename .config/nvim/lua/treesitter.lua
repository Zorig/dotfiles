local M = {}

function M.setup()
	require("nvim-treesitter.configs").setup({
		autopairs = { enable = true },
		ensure_installed = {
			"css",
			"html",
			"graphql",
			"javascript",
			"json",
			"lua",
			"typescript",
			"python",
			"tsx",
			"yaml",
		},
		sync_install = false,
		highlight = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	})
end

return M
