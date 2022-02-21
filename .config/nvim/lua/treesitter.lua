vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
	ensure_installed = { "css", "html", "graphql", "javascript", "json", "lua", "typescript", "python" },
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
