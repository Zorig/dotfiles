local M = {}

function M.setup()
	local t = require("telescope")
	t.load_extension("gh")
	t.setup({
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--no-heading",
				"-u",
			},
		},
	})
end

return M
