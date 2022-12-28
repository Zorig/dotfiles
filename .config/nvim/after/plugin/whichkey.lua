local whichkey = require("which-key")
local conf = {
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
	},
}

local opts = {
	mode = "n", -- Normal mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
	["w"] = { "<cmd>update!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },

	b = {
		name = "Buffer",
		c = { "<Cmd>bd!<Cr>", "Close current buffer" },
		D = { "Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
		b = { "<cmd>Telescope buffers<CR>", "Buffers List" },
	},
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		g = { "<cmd>Telescope live_grep<cr>", "Find Word" },
		m = { "<cmd>Telescope marks<cr>", "Marks" },
		i = { "<cmd>Telescope gh issues<cr>", "Github Issues" },
		p = { "<cmd>Telescope gh pull_request<cr>", "Github PRs" },
	},
	g = {
		name = "Git [Signs & Messenger]",
		s = { "<cmd>Gitsigns toggle_signs<cr>", "[GITSIGNS] Toggle signs" },
		h = { "<cmd>Gitsigns preview_hunk<cr>", "[GITSIGNS] Preview hunk" },
		d = { "<cmd>Gitsigns diffthis<cr>", "[GITSIGNS] Show diff" },
		m = { "<cmd>GitMessenger<cr>", "[Git Messenger] Blame line" },
	},
	l = {
		name = "Code",
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
		d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
		i = { "<cmd>LspInfo<CR>", "Lsp Info" },
		f = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format Document" },
	},
	r = {
		name = "Refactor",
		e = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], "Extract Function" },
		f = {
			[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function to File')<CR>]],
			"Extract Function to File",
		},
		v = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], "Extract Variable" },
		i = { [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], "Inline Variable" },
		r = { [[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]], "Refactor" },
		V = { [[ <Esc><Cmd>lua require('refactoring').debug.print_var({})<CR>]], "Debug Print Var" },
	},
	z = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},
}

whichkey.setup(conf)
whichkey.register({
	["<C-/>"] = { "<cmd>NvimTreeToggle<cr> <cmd>NvimTreeRefresh<cr>", "NvimTree Toggle" },
}, {
	mode = "n", -- Normal mode
	prefix = "",
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
})
whichkey.register(mappings, opts)
