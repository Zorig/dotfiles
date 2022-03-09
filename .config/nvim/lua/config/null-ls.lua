local M = {}

local nls = require("null-ls")
local nls_utils = require("null-ls.utils")

local b = nls.builtins

local sources = {
	-- format
	b.formatting.prettier,
	b.formatting.fixjson,
	b.formatting.black.with({ extra_args = { "--fast" } }),
	b.formatting.isort,
	b.formatting.stylua,

	-- diagnostics
	b.diagnostics.flake8,
	b.diagnostics.eslint,
	b.diagnostics.tsc,
}

function M.setup(opts)
	nls.setup({
		debounce = 150,
		save_after_format = false,
		sources = sources,
		on_attach = opts.on_attach,
		root_dir = nls_utils.root_pattern(".git"),
	})
end
return M
