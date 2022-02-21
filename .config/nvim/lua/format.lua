require("null-ls").setup({
	sources = {
		-- Formating
		require('null-ls').builtins.formatting.isort,
		require('null-ls').builtins.formatting.black,
		require('null-ls').builtins.formatting.prettier,
		require('null-ls').builtins.formatting.stylua,
		-- Diagnostics
		require('null-ls').builtins.diagnostics.tsc,
		require('null-ls').builtins.diagnostics.eslint,
		require('null-ls').builtins.diagnostics.flake8,
	}
})
