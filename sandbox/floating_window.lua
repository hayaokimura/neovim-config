

-- 以下の vimscript を lua に変換する
-- let buf = nvim_create_buf(v:false, v:true)
-- call nvim_buf_set_lines(buf, 0, -1, v:true, ["test", "text"])
-- let opts = {'relative': 'cursor', 'width': 10, 'height': 2, 'col': 0,
--     \ 'row': 1, 'anchor': 'NW', 'style': 'minimal'}
-- let win = nvim_open_win(buf, 0, opts)
-- " optional: change highlight, otherwise Pmenu is used
-- call nvim_win_set_option(win, 'winhl', 'Normal:MyHighlight')

-- 第一引数 ? 第２引数はscratch_buffer を作るかどうか
local buf = vim.api.nvim_create_buf(true, false)
--vim.api.nvim_buf_set_lines(buf, 0, -1, true, {"test", "text"})
local opts = {relative= 'editor', width= 100, height= 30, col= 10, row= 10, anchor= 'NW', style= 'minimal', border='single'}
vim.api.nvim_open_win(buf, 0, opts)
local today = os.date('%Y-%m-%d')
vim.cmd('e ' .. '~/ghq/github.com/hayaokimura/zettelkasten/daily/'..today..'.md')



