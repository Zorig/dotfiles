local M = {}

local nls = require("null-ls")
local nls_utils = require("null-ls.utils")
local b = nls.builtins

--local with_root_file = function(builtin, file)
--return builtin.with {
--condition = function(utils)
--return utils.root_has_file(file)
--end,
--}
--end

local sources = {
	-- diagnostics
	b.diagnostics.flake8,
	b.diagnostics.tsc,
	b.diagnostics.eslint,
	-- formatting
	b.formatting.prettier,
	b.formatting.fixjson,
	b.formatting.isort,
	b.formatting.black,

	-- actions
	b.code_actions.gitsigns,
}

function M.setup(opts)
	nls.setup({
		-- debug = true,
		debounce = 150,
		save_after_format = false,
		sources = sources,
		on_attach = opts.on_attach,
		root_dir = nls_utils.root_pattern(".git"),
	})
end

return M
