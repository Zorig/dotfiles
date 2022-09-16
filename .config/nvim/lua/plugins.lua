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
		use({
			"nvim-telescope/telescope.nvim",
			event = "VimEnter",
			config = function()
				require("config.telescope").setup({})
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
				require("config.nvimtree").setup({})
			end,
		})

		use({
			"folke/which-key.nvim",
			event = "VimEnter",
			config = function()
				require("config.whichkey").setup({})
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
			"SmiteshP/nvim-navic",
			requires = "neovim/nvim-lspconfig",
			module = "nvim-navic",
		})

		-- Misc
		use({ "terryma/vim-multiple-cursors", event = "BufReadPre" })
		use({ "wakatime/vim-wakatime", event = "VimEnter" })

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

		use({
			"echasnovski/mini.nvim",
			config = function()
				require("config.mini")
			end,
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			event = { "BufRead", "BufNewFile", "InsertEnter" },
			requires = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				"jose-elias-alvarez/null-ls.nvim",
				{
					"L3MON4D3/LuaSnip",
					wants = {"friendly-snippets"},
					requires = {"rafamadriz/friendly-snippets"},
					config = function()
						require("config.luasnip")
					end,
				},
			},
			config = function()
				require("config.lsp")
			end,
		})

		use({
			"karb94/neoscroll.nvim",
			event = "VimEnter",
			config = function()
				require("neoscroll").setup()
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
						return { "lsp" }
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
