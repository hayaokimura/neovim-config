-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- color schema
  use 'habamax/vim-gruvbit'

  -- markdown のリンクを踏む
  use {
    'jghauser/follow-md-links.nvim'
  }

  -- git のファイル差分を表示する
  use 'airblade/vim-gitgutter'

  -- git command が叩ける
  use 'tpope/vim-fugitive'

  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
