local M = {}

function M.setup()
	-- Indicate first time installation
	local packer_bootstrap = false

	-- packer.nvim configuration
	local conf = {
		profile = {
			enable = true,
			threshold = 0,
		},
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	}

	-- Check if packer.nvim is installed
	-- Run PackerCompile if there are changes in this file
	local function packer_init()
		local fn = vim.fn
		local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			packer_bootstrap = fn.system({
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
			})
			vim.cmd([[packadd packer.nvim]])
		end
		vim.cmd("autocmd BufWritePost plugins.lua source <afile> | PackerCompile")
	end

	-- Plugins
	local function plugins(use)
		-- Packer
		use({ "wbthomason/packer.nvim" })

		use({
			"rcarriga/nvim-notify",
			event = "VimEnter",
			config = function()
				vim.notify = require("notify")
			end,
		})

		-- Finder
		use({
			"nvim-telescope/telescope.nvim",
			event = "VimEnter",
			config = function()
				require("config.telescope").setup()
			end,
			requires = {
				{ "nvim-lua/plenary.nvim", module = "plenary" },
				{
					"nvim-telescope/telescope-github.nvim",
				},
			},
		})

		-- File
		use({
			"kyazdani42/nvim-web-devicons",
			module = "nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup({ default = true })
			end,
		})
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			cmd = { "NvimTreeToggle", "NvimTreeClose" },
			config = function()
				require("config.nvimtree").setup()
			end,
		})

		use({
			"folke/which-key.nvim",
			event = "VimEnter",
			config = function()
				require("config.whichkey").setup()
			end,
		})

		-- Git
		use({ "tpope/vim-fugitive", cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" } })
		use({
			"lewis6991/gitsigns.nvim",
			event = "BufReadPre",
			wants = "plenary.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("gitsigns").setup()
			end,
		})
		use({ "rhysd/git-messenger.vim", cmd = { "GitMessenger" } })

		-- Status
		use({
			"nvim-lualine/lualine.nvim",
			after = "nvim-treesitter",
			config = function()
				require("config.lualine").setup()
			end,
		})
		use({
			"SmiteshP/nvim-navic",
			requires = "neovim/nvim-lspconfig",
			module = "nvim-navic",
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			opt = true,
			event = "BufRead",
			config = function()
				require("config.treesitter").setup()
			end,
			requires = {
				{ "nvim-treesitter/nvim-treesitter-textobjects" },
			},
		})

		-- Misc
		use({ "scrooloose/nerdcommenter", event = "BufReadPre" })
		use({ "terryma/vim-multiple-cursors", event = "BufReadPre" })
		use({ "wakatime/vim-wakatime", event = "VimEnter" })
		use({ "Yggdroot/indentLine", event = "BufReadPre" })
		use({ "tpope/vim-surround", event = "InsertEnter" })

		-- Color
		use("folke/tokyonight.nvim")

		use({
			"akinsho/toggleterm.nvim",
			cmd = { "ToggleTerm", "TermExec" },
			keys = { [[<C-\>]] },
			config = function()
				require("config.terminal").setup()
			end,
		})

		use({ "williamboman/nvim-lsp-installer" })

		use({ "jose-elias-alvarez/null-ls.nvim" })

		-- completion
		use({
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			opt = true,
			config = function()
				require("config.cmp").setup()
			end,
			wants = { "LuaSnip" },
			requires = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
				"ray-x/cmp-treesitter",
				"hrsh7th/cmp-cmdline",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp",
				{
					"L3MON4D3/LuaSnip",
					wants = { "friendly-snippets" },
					config = function()
						require("config.luasnip").setup()
					end,
				},
				"rafamadriz/friendly-snippets",
				disable = true,
			},
		})

		-- AI completion
		use({ "github/copilot.vim", event = "InsertEnter" })

		use({
			"windwp/nvim-autopairs",
			wants = "nvim-treesitter",
			module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
			config = function()
				require("config.autopairs").setup()
			end,
		})

		use({
			"windwp/nvim-ts-autotag",
			wants = "nvim-treesitter",
			event = "InsertEnter",
			config = function()
				require("nvim-ts-autotag").setup({ enable = true })
			end,
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			opt = true,
			event = { "BufRead", "BufNewFile", "InsertEnter" },
			wants = { "nvim-lsp-installer", "cmp-nvim-lsp", "null-ls.nvim" },
			config = function()
				require("config.lsp").setup()
			end,
			requires = {
				"williamboman/nvim-lsp-installer",
				"jose-elias-alvarez/null-ls.nvim",
			},
		})
		--Test
		use({
			"rcarriga/vim-ultest",
			requires = { "vim-test/vim-test" },
			opt = true,
			keys = { "<leader>t" },
			cmd = {
				"TestNearest",
				"TestFile",
				"TestSuite",
				"TestLast",
				"TestVisit",
				"Ultest",
				"UltestNearest",
				"UltestDebug",
				"UltestLast",
				"UltestSummary",
			},
			module = "ultest",
			run = ":UpdateRemotePlugins",
			config = function()
				require("config.test").setup()
			end,
		})

		use({
			"karb94/neoscroll.nvim",
			event = "VimEnter",
			config = function()
				require("neoscroll").setup()
			end,
		})

		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("alpha").setup(require("alpha.themes.theta").config)
			end,
		})

		use {
			"kevinhwang91/nvim-ufo",
			opt = true,
			event = { "BufReadPre" },
			wants = { "promise-async" },
			requires = "kevinhwang91/promise-async",
			config = function()
				require("ufo").setup {
					provider_selector = function(bufnr, filetype)
						return { "lsp", "treesitter", "indent" }
					end,
				}
				vim.keymap.set("n", "zR", require("ufo").openAllFolds)
				vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			end,
		}
		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			print("Restart Neovim required after installation!")
			require("packer").sync()
		end
	end

	packer_init()

	local packer = require("packer")
	packer.init(conf)
	packer.startup(plugins)
end

return M
