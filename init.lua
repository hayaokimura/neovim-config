
-- 行番号を表示する
vim.opt.number = true

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- leader key の変更
vim.g.mapleader = " "

-- scroll bar 有効化
require("scrollbar").setup()

require('gitsigns').setup {}

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
  ensure_installed = { "lua", "markdown", "markdown_inline", "ruby", "javascript" },
  highlight = {
    enable = false,
  },
  indent = {
    enable = true,
  }
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
-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  -- snippet = {
  --   -- REQUIRED - you must specify a snippet engine
  --   expand = function(args)
  --     vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  --     -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --     -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
  --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  --   end,
  -- },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
    -- {name = 'path'},
    -- {name = 'buffer'},
    -- {name = 'cmdline'},
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- TODO: コピペしたので理解する
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers {
  function(server_name)
    print(server_name)
    if server_name == 'ruby_ls' then
      lspconfig[server_name].setup {
	      cmd = { 'bundle', 'exec', 'ruby-lsp' },
        capabilities = capabilities,
      }
    elseif server_name == 'sumneko_lua' then
      lspconfig[server_name].setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
            },
          },
        },
      }
    else
      lspconfig[server_name].setup {
        capabilities = capabilities,
      }
    end
  end
}

-- KeyMapping for lsp
local opts = {expr = true, noremap = true}
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)

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








