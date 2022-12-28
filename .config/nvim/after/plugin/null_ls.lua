local null_ls = require("null-ls")
local nls_utils = require("null-ls.utils")

null_ls.setup({
	debounce = 150,
	save_after_format = false,
	root_dir = nls_utils.root_pattern(".git"),
	sources = {
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.tsc,
		null_ls.builtins.diagnostics.eslint,

		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.fixjson,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.code_actions.refactoring,

		null_ls.builtins.completion.spell,
	},
})
