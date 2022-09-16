local keymap = vim.keymap.set
local api = vim.api
local navic = require("nvim-navic")

----------------- LSP servers --------------------------
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
					library = api.nvim_get_runtime_file("", true)
				},
				telemetry = { enable = false },
			},
		},
	},
	tsserver = {},
}

-------------- LSP functions --------------------------

local function keymappings(_, bufnr)
	local whichkey = require "which-key"
	local opts = { noremap = true, silent = true }

	keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
	keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
	keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

	keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap("n", "gb", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

	api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
	api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })

	---- Whichkey
	local keymap_l = {
		l = {
			name = "Code",
			r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
			a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
			d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
			i = { "<cmd>LspInfo<CR>", "Lsp Info" },
			f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" },
		},
	}

	local keymap_g = {
		name = "Goto",
		d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
		D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
		I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Goto Type References" },
	}
	whichkey.register(keymap_l, { buffer = bufnr, prefix = "<leader>" })
	whichkey.register(keymap_g, { buffer = bufnr, prefix = "g" })
end

local function highlighting(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		local lsp_highlight_grp = api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
		api.nvim_create_autocmd("CursorHold", {
			callback = function()
				vim.schedule(vim.lsp.buf.document_highlight)
			end,
			group = lsp_highlight_grp,
			buffer = bufnr,
		})
		api.nvim_create_autocmd("CursorMoved", {
			callback = function()
				vim.schedule(vim.lsp.buf.clear_references)
			end,
			group = lsp_highlight_grp,
			buffer = bufnr,
		})
	end
end

local function lsp_handlers()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	-- LSP handlers configuration
	local config = {
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
		},

		diagnostic = {
			virtual_text = { severity = vim.diagnostic.severity.ERROR },
			signs = {
				active = signs,
			},
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		},
	}

	vim.diagnostic.config(config.diagnostic)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)
end

local function formatting(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		local function format()
			local view = vim.fn.winsaveview()
			vim.lsp.buf.format({
				async = true,
				filter = function(attached_client)
					return attached_client.name ~= ""
				end,
			})
			vim.fn.winrestview(view)
		end

		local lsp_format_grp = api.nvim_create_augroup("LspFormat", { clear = true })
		api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.schedule(format)
			end,
			group = lsp_format_grp,
			buffer = bufnr,
		})
	end
end

local function on_attach(client, bufnr)
	-- api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- api.nvim_buf_set_option(bufnr, "completefunc", "v:lua.vim.lsp.omnifunc")
	api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.MiniCompletion.completefunc_lsp")
	api.nvim_buf_set_option(bufnr, "completefunc", "v:lua.MiniCompletion.completefunc_lsp")

	api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
	if client.server_capabilities.definitionProvider then
		api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
	end

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	keymappings(client, bufnr)
	highlighting(client, bufnr)
	formatting(client, bufnr)
	-- signature_help(client, bufnr)
end

----------------------------- LSP Setup -------------------------
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_handlers()

local server_opts = {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
}

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = vim.tbl_keys(servers),
	automatic_installation = false,
})

local lspconfig = require("lspconfig")


local nls = require("null-ls")
local nls_utils = require("null-ls.utils")
local b = nls.builtins
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
	b.code_actions.refactoring,
}


require("mason-lspconfig").setup_handlers({
	function(server_name)
		local extended_opts = vim.tbl_deep_extend("force", server_opts, servers[server_name] or {})
		lspconfig[server_name].setup(extended_opts)

		nls.setup({
			-- debug = true,
			debounce = 150,
			save_after_format = false,
			sources = sources,
			on_attach = on_attach,
			root_dir = nls_utils.root_pattern(".git"),
		})
	end,
	-- You can set up other server specific config
})
