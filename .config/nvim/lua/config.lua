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
g.mapleader = " "                    	-- change leader
opt.completeopt = "menuone,noselect" 	-- set completeopt to better completion
opt.cursorline = true                	-- cursor line
opt.cursorcolumn = true								-- cursor col
opt.hlsearch = true                  	-- highlight on search
opt.ignorecase = true                	-- ignore case on search
opt.mouse = 'a'                      	-- activate mouse
opt.smartcase = true                 	-- ignore lowercase
opt.swapfile = false                 	-- no swapfile
opt.splitright = true                	-- vertical split to the right
opt.splitbelow = true                	-- horizontal split to the bottom
opt.incsearch = true                 	-- highlight match while typing
opt.showmatch = true                 	-- highlight matching parenthesis
opt.number = true 		     						-- show line number
opt.smartindent = true               	-- auto indent
opt.undofile = true                   -- undo 
opt.undolevels = 100                  -- undo history
opt.history = 100                    	-- remember n lines
opt.lazyredraw = true                 -- faster scroll
opt.synmaxcol = 240										-- max cols for syntax highlight
opt.hidden = true                    	-- wont save while switching buffer
opt.clipboard = 'unnamedplus'         -- system clipboard
opt.tabstop = 2												-- tab size == 4 spaces
opt.shiftwidth = 2										-- shift 4 spaces on tab
opt.signcolumn='yes'									-- sign on column
opt.showmode = false									-- no mode on status
g.python3_host_prog = "/usr/bin/python3"
-----------------------------------------------------------
-- Color
--
g.tokyonight_italic_functions = true
g.tokyonight_italic_variables = true
cmd[[colorscheme tokyonight]]

-----------------------------------------------------------
-- Startup
--
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

-----------------------------------------------------------
-- KeyMap
--- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

map('n', '<leader>y', '"*y', {noremap=true})
map('n', '<leader>p', '"*p', {noremap=true})
map('n', '<leader>Y', '"+y', {noremap=true})
map('n', '<leader>P', '"+p', {noremap=true})
