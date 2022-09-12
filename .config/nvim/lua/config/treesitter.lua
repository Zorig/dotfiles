local M = {}

function M.setup()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "css", "html", "graphql", "javascript", "json", "lua", "typescript", "python", "tsx" },
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
	})
end

return M
