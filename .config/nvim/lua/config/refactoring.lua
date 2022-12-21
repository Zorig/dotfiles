local M = {}

function M.setup()
	require("refactoring").setup({})
	require("telescope").load_extension("refactoring")
end

return M
