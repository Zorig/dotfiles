-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.cursorline = false
opt.number = false
opt.relativenumber = false

-- Start with code folded when opening a file (LazyVim defaults to 99 = all open).
-- 0 = fold everything; 1 = keep top-level visible, fold nested blocks.
opt.foldlevel = 0
-- Don't persist fold state in sessions, otherwise a restored session re-applies
-- `setlocal foldlevel=99` and everything opens unfolded.
opt.sessionoptions:remove("folds")

-- Use snacks for the explorer and picker. lazyvim.json is install_version 7,
-- which otherwise keeps the legacy defaults (neo-tree and fzf-lua).
vim.g.lazyvim_explorer = "snacks"
vim.g.lazyvim_picker = "snacks"
