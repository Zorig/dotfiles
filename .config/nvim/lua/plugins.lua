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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
