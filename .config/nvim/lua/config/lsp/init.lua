local M = {}

local servers = {
	html = {},
	jsonls = {},
	pylsp = {
		settings = {
			pylsp = {
				configurationSources = { "flake8" },
				plugins = {
					pylint = { enabled = false },
					flake8 = { enabled = true },
					pycodestyle = { enabled = false },
					pyflakes = { enabled = false },
				},
			},
		},
	},
	sumneko_lua = {
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
				},
			},
		},
	},
	tsserver = {},
	graphql = {},
}

local function on_attach(client, bufnr)
	-- Enable completion triggered by <C-X><C-O>
	-- See `:help omnifunc` and `:help ins-completion` for more information.
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Use LSP as the handler for formatexpr.
	-- See `:help formatexpr` for more information.
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	if client.name == "tsserver" or client.name == "pylsp" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end

	-- Configure key mappings
	require("config.lsp.keymaps").setup(client, bufnr)
	require("config.lsp.highlighting").setup(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local opts = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
}

require("config.lsp.handlers").setup()

function M.setup()
	require("config.lsp.null-ls").setup(opts)
	require("config.lsp.installer").setup(servers, opts)
end

return M
