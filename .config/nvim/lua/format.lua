local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- Formating
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prettier.with({
			prefer_local = "/usr/local/bin/prettier",
		}),
		null_ls.builtins.formatting.stylua,
		-- Diagnostics
		null_ls.builtins.diagnostics.tsc,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.flake8,
	},
})
