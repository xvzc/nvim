local util = require('util')

local silent_noremap = { silent = true, noremap = true }
local silent_noremap_expr = { silent = true, noremap = true, expr = true }

util.nmap('<leader>-', ':sp<CR><C-w>j', silent_noremap)
util.nmap('<leader>_', ':vsp<CR><C-w>l', silent_noremap)

util.nmap('<leader>y', '"+y', silent_noremap)
util.vmap('<leader>y', '"+y', silent_noremap)

util.nmap('<leader>d', '"+d', silent_noremap)
util.vmap('<leader>d', '"+d', silent_noremap)
util.nmap('<leader>D', '"+D', silent_noremap)

util.nmap('<leader>p', '"+p', silent_noremap)
util.nmap('<F5>', '<C-l>', silent_noremap)
util.nmap('<leader>a', 'gg<S-v><S-g>', silent_noremap)

-- diagnostics
util.nmap('[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
util.nmap(']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)

-- move lines
-- global.nmap('<C-k>', 'm`:m--<CR>==``', silent_noremap)
-- global.nmap('<C-j>', 'm`:m +1<CR>==``', silent_noremap)

-- open file
util.nmap('go', 'gf', silent_noremap)

local is_sidebar = function()
  if vim.bo.filetype == 'lspsagaoutline' then
    return true
  end

  if vim.bo.filetype == 'NvimTree' then
    return true
  end

  return false
end

util.nmap('<esc>', function()
  -- local cur_winid = vim.api.nvim_get_current_win()
  -- local cur_win = vim.api.nvim_win_get_config(cur_winid)
  -- if cur_win.zindex then
  --   return ":close<CR>"
  -- end

  -- local wins = vim.api.nvim_tabpage_list_wins(0)
  -- for _, winid in pairs(wins) do
  --   if vim.api.nvim_win_get_config(winid).zindex and not is_sidebar() then
  --     return "<C-w>o"
  --   end
  -- end

  if vim.api.nvim_get_vvar('hlsearch') == 1 then
    return ":nohl<CR><esc>"
  end

  return "<esc>"
end, silent_noremap_expr)

util.autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '**/baekJoon/*',
  callback = function()
    util.nmap(
      '<C-M-s>',
      ':lua require("util").boj_submit()<CR>',
      silent_noremap)
  end
})

-- util.autocmd({ 'filetype' }, {
--   pattern = 'json',
--   callback = function()
--     util.nmap(
--       '<C-l>',
--       ":execute ':%!python3 -m json.tool --no-ensure-ascii'<CR>",
--       silent_noremap)
--   end
-- })
