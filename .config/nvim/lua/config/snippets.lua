local M = {}

local luasnip = require("luasnip")

function M.setup()
	luasnip.config.set_config({
		history = false,
		updateevents = "TextChanged,TextChangedI",
	})
	luasnip.filetype_extend("python", { "django" })
	require("luasnip.loaders.from_vscode").load()
end

return M
