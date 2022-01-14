local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Finder
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
  
  -- File
  use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}
  
  -- Git
  use 'tpope/vim-fugitive'
	use 'mhinz/vim-signify'
	use 'rhysd/git-messenger.vim'

  -- Status
  use 'nvim-lualine/lualine.nvim'

	-- Misc
	use 'scrooloose/nerdcommenter'
	use 'terryma/vim-multiple-cursors'
	use 'wakatime/vim-wakatime'
	use 'Yggdroot/indentLine'
	use 'tpope/vim-surround'
	use 'jiangmiao/auto-pairs'

	-- LSP
	use 'neovim/nvim-lspconfig'	
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'saadparwaiz1/cmp_luasnip'
	use {'L3MON4D3/LuaSnip', requires = {{"rafamadriz/friendly-snippets"}}, after = 'nvim-cmp'}

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Color	
	use 'folke/tokyonight.nvim'

	-- Format
	use 'jose-elias-alvarez/null-ls.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
