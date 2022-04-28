local M = {}

function M.setup()
	local toggleterm = require("toggleterm")
	toggleterm.setup({
		size = 20,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		direction = "float",
		close_on_exit = true,
		shade_terminals = false,
		float_opts = {
			border = "curved",
			winbled = 0,
			highlights = { border = "Normal", background = "Normal" },
		},
	})
end

return M
