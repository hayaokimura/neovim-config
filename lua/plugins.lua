-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'habamax/vim-gruvbit' -- color schema
  use 'jghauser/follow-md-links.nvim' -- markdown のリンクを踏むと飛べる
  use 'airblade/vim-gitgutter' -- git のファイル差分を表示する
  use 'tpope/vim-fugitive' -- git command が叩ける
  use 'kassio/neoterm' -- terminal の wrapper

  -- ファイル検索ができる
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- tree 表示をする
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use 'mickael-menu/zk-nvim' -- zk command を vim から使えるらしい
  
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- syntax highlight

end)
