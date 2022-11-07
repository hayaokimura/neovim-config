
-- 行番号を表示する
vim.opt.number = true

-- leader key の変更
vim.g.mapleader = " "


-- packer の plugin を記述しているファイルを読み込む
require'plugins'

-- colorschema 読み込み
vim.cmd("set termguicolors")
vim.cmd("colorscheme gruvbit")

-- command alias of telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- bs で前のファイルに戻れる設定 follow md links に依存している
vim.keymap.set('n', '<bs>', ':edit #<cr>', { silent = true })

--treesitter でパーサを自動インストールする設定。
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "markdown", "markdown_inline" },
  highlight = {
    enable = false,
  },
}

--zk-nvim のセットアップ
require("zk").setup()

