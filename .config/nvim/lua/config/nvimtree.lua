local M = {}

function M.setup()
	require("nvim-tree").setup({
		actions = {
			change_dir = {
				global = false,
			},
			open_file = {
				quit_on_open = true,
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
end

return M
