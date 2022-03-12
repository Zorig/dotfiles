local g = vim.g
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }


map("n", "<C-_>", ":NvimTreeToggle<CR>", default_opts)
map("n", "<leader>r", ":NvimTreeRefresh<CR>", default_opts)

map("n", "<C-p>", ":Telescope find_files<cr>", default_opts)
map("n", "<leader>fg", ":Telescope live_grep<cr>", default_opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", default_opts)

-- Indentline
g.indentLine_first_char = "▏"
g.indentLine_char_list = { "▏", "│", "┆", "┊" }
g.indentLine_showFirstIndentLevel = 1
g.indentLine_setColors = 1
g.indentLine_fileTypeExclude = { "dashboard" }

---- ToggleTerm
require("toggleterm").setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	direction = "float",
	shell = vim.o.shell,
	close_on_exit = true,
	shade_terminals = true,
	float_opts = {
		border = "curved",
		winbled = 0,
		highlights = { border = "Normal", background = "Normal" },
	},
})
--vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true, silent = true })

-- dashboard
g.dashboard_default_executive = "telescope"
map("n", "<leader>ss", ":<C-u>SessionSave<CR>", default_opts)
map("n", "<leader>sl", ":<C-u>SessionLoad<CR>", default_opts)
map("n", "<leader>ff", ":DashboardFindFile<cr>", default_opts)
map("n", "<leader>fh", ":DashboardFindHistory<cr>", default_opts)
map("n", "<leader>fw", ":DashboardFindWord<cr>", default_opts)
map("n", "<leader>bm", ":DashboardJumpMark<cr>", default_opts)
--g.dashboard_custom_shortcut = {
--a={description={'last session                 SPC s l'}, command = "SessionLoad"},
--b={description={'find history                 SPC f h'}, command = "Telescope oldfiles"},
--d={description={'find file                    SPC f f'}, command = "Telescope find_files"},
--e={description={'find word                    SPC f w'}, command = "Telescope live_grep"},
--f={description={'jump mark                    SPC b m'}, command = "Telescope marks"},
--}
