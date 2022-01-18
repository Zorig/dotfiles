local g = vim.g
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Nvim Tree
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1
}

require('nvim-tree').setup({
	view = {
		side = 'right',
	}
})

map('n', '<C-\\>', ':NvimTreeToggle<CR>', default_opts)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)
map('n', '<leader>\\', ':NvimTreeFocus<CR>', default_opts)
-- Telescope
require('telescope').setup({
	defaults = {
		layout_strategy = 'vertical'
	}
})
map('n', '<C-p>', ':Telescope find_files<cr>', default_opts)
map('n', '<leader>fg', ':Telescope live_grep<cr>', default_opts)
map('n', '<leader>fb', ':Telescope buffers<cr>', default_opts)

-- Lualine
require('lualine').setup({
	options = {
		theme = 'tokyonight'
	}
})


-- Indentline
g.indentLine_first_char = '▏'
g.indentLine_char_list = { '▏', '│', '┆', '┊' }
g.indentLine_showFirstIndentLevel = 1
g.indentLine_setColors = 1
