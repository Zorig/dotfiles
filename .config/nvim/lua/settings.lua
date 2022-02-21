local g = vim.g
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Nvim Tree
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
}

require("nvim-tree").setup({
	view = {
		side = "right",
	},
})

map("n", "<C-_>", ":NvimTreeToggle<CR>", default_opts)
map("n", "<leader>r", ":NvimTreeRefresh<CR>", default_opts)

-- Telescope
require("telescope").setup({
	defaults = {
		layout_strategy = "vertical",
	},
})
map("n", "<C-p>", ":Telescope find_files<cr>", default_opts)
map("n", "<leader>fg", ":Telescope live_grep<cr>", default_opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", default_opts)

-- Lualine
require("lualine").setup({
	extensions = {'fugitive', 'nvim-tree', 'toggleterm'},
	options = {
		theme = "tokyonight",
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {{'filename', file_status = true, path = 1}},
		lualine_x = {'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	}
})
-- Indentline
g.indentLine_first_char = "▏"
g.indentLine_char_list = { "▏", "│", "┆", "┊" }
g.indentLine_showFirstIndentLevel = 1
g.indentLine_setColors = 1



-- ToggleTerm
require('toggleterm').setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	direction  = 'float',
	shell = vim.o.shell,
	close_on_exit = true,
	shade_terminals = true,
	float_opts = {
		border = "curved",
		winbled = 0,
		highlights = {border = "Normal", background = "Normal"}
	},
})
--vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true, silent = true })
