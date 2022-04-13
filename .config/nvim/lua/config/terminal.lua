local M = {}

function M.setup()
	local toggleterm = require("toggleterm")
	toggleterm.setup({
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
end

return M
