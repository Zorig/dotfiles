local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load({
	include = { "python", "javascript", "typescript", "typescriptreact", "html", "css", "json", "graphql", "lua" },
})

NVMM.luasnip_go_right = function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end

NVMM.luasnip_go_left = function()
  if luasnip.jumpable() then
    luasnip.jump(-1)
  end
end

luasnip.filetype_extend("python", { "django" })
luasnip.filetype_extend("javascript", { "typescript", "react", "react-ts", "react-native", "react-native-ts" })

luasnip.config.set_config({
	history = false,
	updateevents = "TextChanged,TextChangedI",
})

vim.api.nvim_set_keymap("i", "<C-l>", [[<Cmd>lua NVMM.luasnip_go_right()<CR>]], {})
vim.api.nvim_set_keymap("s", "<C-l>", [[<Cmd>lua NVMM.luasnip_go_right()<CR>]], {})

vim.api.nvim_set_keymap("i", "<C-h>", [[<Cmd>lua NVMM.luasnip_go_left()<CR>]], {})
vim.api.nvim_set_keymap("s", "<C-h>", [[<Cmd>lua NVMM.luasnip_go_left()<CR>]], {})

local luasnip_ns = vim.api.nvim_create_namespace("luasnip")

NVMM.luasnip_notify_clear = function()
  vim.api.nvim_buf_clear_namespace(0, luasnip_ns, 0, -1)
end

NVMM.luasnip_notify = function()
  if not luasnip.expandable() then
    NVMM.luasnip_notify_clear()
    return
  end

  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  vim.api.nvim_buf_set_virtual_text(0, luasnip_ns, line, { { "!", "Special" } }, {})
end

vim.cmd([[au InsertEnter,CursorMovedI,TextChangedI,TextChangedP * lua pcall(NVMM.luasnip_notify)]])
vim.cmd([[au InsertLeave * lua pcall(NVMM.luasnip_notify_clear)]])
