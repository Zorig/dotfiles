local M = {}

function M.setup()
	local luasnip = require("luasnip")
	require("luasnip.loaders.from_vscode").load({
		include = { "python", "javascript", "typescript", "typescriptreact", "html", "css", "json", "graphql", "lua" },
	})

	luasnip.filetype_extend("python", { "django" })
	luasnip.filetype_extend("javascript", { "typescript", "react", "react-ts", "react-native", "react-native-ts" })

	luasnip.config.set_config({
		history = false,
		updateevents = "TextChanged,TextChangedI",
	})
end

return M
