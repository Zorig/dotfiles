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
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  
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

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	---- Completion
	--use 'hrsh7th/cmp-nvim-lsp'
	--use 'hrsh7th/cmp-buffer'
	--use 'hrsh7th/cmp-path'
	--use 'hrsh7th/cmp-cmdline'
	--use 'saadparwaiz1/cmp_luasnip'
	--use 'L3MON4D3/LuaSnip'

	--use({'hrsh7th/nvim-cmp', after = {
			--"LuaSnip",
			--"cmp_luasnip",
			--"cmp-nvim-lsp",
			--"cmp-buffer",
			--"cmp-path",
			--"cmp-cmdline"
		--};
	--})
	-- Color	
	use 'folke/tokyonight.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
