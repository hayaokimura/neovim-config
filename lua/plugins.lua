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

  -- cf. https://joker1007.hatenablog.com/entry/2022/09/03/172957
  -- TODO: ちゃんと役割を整理する
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- cf. https://joker1007.hatenablog.com/entry/2022/09/03/172957
  -- TODO: ちゃんと役割を整理する
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp', -- https://github.com/hrsh7th/cmp-nvim-lsp TODO: こいつの役割を明確にする
    -- TODO: snippet を使えるようにできるらしい cf. https://github.com/hrsh7th/nvim-cmp#recommended-configuration
  }


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

  use '/Users/hayao-kimura/ghq/github.com/hayaokimura/telekasten.nvim' -- zettelkasten を使える
  
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- syntax highlight

end)
