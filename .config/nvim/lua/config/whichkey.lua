local M = {}

function M.setup()
  local whichkey = require "which-key"

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
		["fg"] = {"<cmd>Telescope live_grep<CR>", "Find Word"},

    b = {
      name = "Buffer",
      c = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
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
