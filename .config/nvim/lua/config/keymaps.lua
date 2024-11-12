-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

map("n", "<leader>[", ":bp<CR>", default_opts)
map("n", "<leader>]", ":bn<CR>", default_opts)
