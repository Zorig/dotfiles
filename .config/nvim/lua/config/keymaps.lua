-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap
local default_opts = { noremap = true, silent = true }

map.set("n", "<leader>[", ":bp<CR>", default_opts)
map.set("n", "<leader>]", ":bn<CR>", default_opts)
