
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
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fc', builtin.oldfiles, {})

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


-- nvim-tree の setup に従ったhttps://github.com/nvim-tree/nvim-tree.lua#setup
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- empty setup using defaults
require("mason").setup()

-- 設定が書いてあるフォルダを開くエイリアス
vim.api.nvim_create_user_command('Config', 'tabnew | e ~/.config/nvim', { nargs = 0 })

-- 今日の DailyNote を開くエイリアス
vim.api.nvim_create_user_command('DailyNote', 'cd ~/ghq/github.com/hayaokimura/dailynote | ZkNew', { nargs = 0 })

-- rspec neoterm 設定
vim.g.neoterm_default_mod='belowright'
vim.g.neoterm_size=25
vim.g.neoterm_autoscroll=1
vim.g.neoterm_rspec_cmd='SKIP_SEED=1 bin/rspec'



vim.keymap.set('n', '<Leader>l', function()
  local opt = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), '')..':'..vim.api.nvim_win_get_cursor(0)[1]
  local command_str = vim.g.neoterm_rspec_cmd..' '..opt
  vim.fn['neoterm#do']({ cmd = command_str })
end)
vim.keymap.set('n', '<Leader>t', function()
  local opt = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), '')
  local command_str = vim.g.neoterm_rspec_cmd..' '..opt
  vim.fn['neoterm#do']({ cmd = command_str })
end)








