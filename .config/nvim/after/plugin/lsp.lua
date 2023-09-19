local lsp = require("lsp-zero")
lsp.preset("recommended")
local lspconfig = require("lspconfig")

lsp.ensure_installed({
	"tsserver",
	"pylsp",
	"lua_ls",
	"eslint",
	"jsonls",
})

lspconfig.pylsp.setup({
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
})

lspconfig.lua_ls.setup({
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
})

lsp.setup_nvim_cmp({
	preselect = "none",
	completion = {
		completeopt = "menu,menuone,noinsert,noselect",
	},
	documentation = {
		max_height = 15,
		max_width = 60,
		border = "rounded",
		col_offset = 0,
		side_padding = 1,
		winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
		zindex = 1001,
	},
	formatting = {
		-- changing the order of fields so the icon is the first
		fields = { "menu", "abbr", "kind" },

		-- here is where the change happens
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				luasnip = "⋗",
				buffer = "Ω",
				path = "🖫",
				nvim_lua = "Π",
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})

lsp.setup()

