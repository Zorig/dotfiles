vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	actions = {
		change_dir = {
			global = false,
		},
		open_file = {
			quit_on_open = false,
		},
	},
	diagnostics = {
		enable = false,
	},
	disable_netrw = true,
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	hijack_netrw = true,
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	view = {
		side = "right",
		signcolumn = "yes",
		hide_root_folder = true,
	},
})
