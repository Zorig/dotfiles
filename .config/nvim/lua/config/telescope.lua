local M = {}

function M.setup()
	local t = require("telescope")
	t.load_extension("gh")
	t.setup({
		defaults = {
			file_ignore_patterns = { 'node_modules', '.git' }
		}
	})
end

return M
