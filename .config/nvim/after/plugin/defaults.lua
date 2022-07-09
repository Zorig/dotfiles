-----------------------------------------------------------
-- Neovim API
--
local cmd = vim.cmd
local g = vim.g
local opt = vim.opt
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- General
--
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " " -- change leader
g.maplocalleader = " " -- change leader
opt.completeopt = "menuone,noselect" -- set completeopt to better completion
opt.hlsearch = true -- highlight on search
opt.ignorecase = true -- ignore case on search
opt.mouse = "a" -- activate mouse
opt.smartcase = true -- ignore lowercase
opt.swapfile = false -- no swapfile
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- horizontal split to the bottom
opt.incsearch = true -- highlight match while typing
opt.showmatch = true -- highlight matching parenthesis
opt.number = true -- show line number
opt.smartindent = true -- auto indent
opt.undofile = true -- undo
opt.undolevels = 100 -- undo history
opt.history = 100 -- remember n lines
opt.lazyredraw = true -- faster scroll
opt.updatetime = 250 -- decrease update time
opt.synmaxcol = 240 -- max cols for syntax highlight
opt.hidden = true -- wont save while switching buffer
opt.clipboard = "unnamedplus" -- system clipboard
opt.showmode = false -- no mode on status
opt.encoding = "utf8"
opt.timeoutlen = 500
vim.wo.signcolumn = "yes" -- sign on column
g.python3_host_prog = "/usr/bin/python3"
opt.fillchars = {
	vert = "│",
	fold = " ",
	eob = " ", -- suppress ~ at EndOfBuffer
	--diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

opt.tabstop = 2 -- tab size == 4 spaces
opt.shiftwidth = 2 -- shift 4 spaces on tab
opt.softtabstop = 2

--function MyFoldText()
--local line = vim.fn.getline(vim.v.foldstart)
--local nblines = vim.v.foldend - vim.v.foldstart + 1
--return "  " .. line .. ": " .. nblines .. " lines"
--end
--opt.foldtext = "v:lua.MyFoldText()"
-----------------------------------------------------------
-- Color
--
g.tokyonight_italic_functions = true
g.tokyonight_italic_variables = true
cmd([[colorscheme tokyonight]])

-----------------------------------------------------------
-- KeyMap
--- move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h", { noremap = true })
map("n", "<C-j>", "<C-w>j", default_opts)
map("n", "<C-k>", "<C-w>k", default_opts)
map("n", "<C-l>", "<C-w>l", default_opts)
--- Yank/Paste
map("n", "<leader>y", '"*y', { noremap = true })
map("n", "<leader>p", '"*p', { noremap = true })
map("n", "<leader>Y", '"+y', { noremap = true })
map("n", "<leader>P", '"+p', { noremap = true })
--- Fast save
--map("n", "<leader>s", ":w<cr>", default_opts)
--map("i", "<leader>s", "<C-c>:w<cr>", default_opts)
--- Move current line / block with Alt-j/k ala vscode.
map("x", "<C-S-k>", ":m '<-2<CR>gv=gv", { noremap = true })
map("x", "<C-S-j>", ":m '>+1<CR>gv=gv", { noremap = true })

map("n", "<leader>[", ":bp<CR>", default_opts)
map("n", "<leader>]", ":bn<CR>", default_opts)

g.indentLine_first_char = "▏"
g.indentLine_char_list = { "▏", "│", "┆", "┊" }
g.indentLine_showFirstIndentLevel = 1
g.indentLine_setColors = 1

opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = -1
opt.foldenable = true
