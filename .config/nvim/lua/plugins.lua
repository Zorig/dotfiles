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

		-- Finder
		use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })

		-- File
		use({
			"kyazdani42/nvim-web-devicons",
			module = "nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup({ default = true })
			end,
		})
		use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })

		-- Git
		use({ "tpope/vim-fugitive", cmd = "Git" })
		use("mhinz/vim-signify")
		use({ "rhysd/git-messenger.vim", cmd = "GitMessenger" })

		-- Status
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("config.status").setup()
			end,
		})
		use({
			"SmiteshP/nvim-gps",
			requires = "nvim-treesitter/nvim-treesitter",
			module = "nvim-gps",
			config = function()
				require("nvim-gps").setup()
			end,
		})

		-- Misc
		use({ "scrooloose/nerdcommenter", event = "BufReadPre" })
		use({ "terryma/vim-multiple-cursors", event = "BufReadPre" })
		use("wakatime/vim-wakatime")
		use({ "Yggdroot/indentLine", event = "VimEnter" })
		use({ "tpope/vim-surround", event = "BufReadPre" })
		use({
			"windwp/nvim-autopairs",
			wants = "nvim-treesitter",
			--module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
			config = function()
				require("autopairs").setup()
			end,
		})
		-- Auto tag
		use({
			"windwp/nvim-ts-autotag",
			wants = "nvim-treesitter",
			config = function()
				require("nvim-ts-autotag").setup({ enable = true })
			end,
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			wants = { "nvim-lsp-installer", "cmp-nvim-lsp", "lsp_signature.nvim", "null-ls.nvim" },
			config = function()
				require("lsp").setup()
			end,
			requires = {
				"williamboman/nvim-lsp-installer",
				"ray-x/lsp_signature.nvim",
				"jose-elias-alvarez/null-ls.nvim",
				"hrsh7th/cmp-nvim-lsp",
			},
		})
		use({
			"hrsh7th/nvim-cmp",
			opt = true,
			config = function()
				require("cmp").setup()
			end,
			wants = { "LuaSnip" },
			requires = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-calc",
				"hrsh7th/cmp-emoji",
				"ray-x/cmp-treesitter",
				"saadparwaiz1/cmp_luasnip",
				"f3fora/cmp-spell",
				{
					"L3MON4D3/LuaSnip",
					wants = "friendly-snippets",
					config = function()
						require("config.snippets").setup()
					end,
				},
				"rafamadriz/friendly-snippets",
				disable = false,
			},
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("treesitter").setup()
			end,
		})

		-- Color
		use("folke/tokyonight.nvim")

		use({ "akinsho/toggleterm.nvim" })
		use("glepnir/dashboard-nvim")

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
