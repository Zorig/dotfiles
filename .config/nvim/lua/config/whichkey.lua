local M = {}

function M.setup()
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
		t = {
			name = "Test",
			S = { "<cmd>UltestSummary<cr>", "Summary" },
			a = { "<cmd>Ultest<cr>", "All" },
			d = { "<cmd>UltestDebug<cr>", "Debug" },
			f = { "<cmd>TestFile<cr>", "File" },
			l = { "<cmd>TestLast<cr>", "Last" },
			n = { "<cmd>TestNearest<cr>", "Nearest" },
			o = { "<cmd>UltestOutput<cr>", "Output" },
			s = { "<cmd>TestSuite<cr>", "Suite" },
			v = { "<cmd>TestVisit<cr>", "Visit" },
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
	whichkey.register(mappings, opts)
end

return M
