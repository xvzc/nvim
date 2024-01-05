-- vim.cmd([[
-- colorscheme tokyonight
--
-- hi Comment ctermfg=14 gui=italic guifg=#6b806e
--
-- command! -bang -nargs=? -complete=dir HiGroup
-- \ echo synIDattr(synID(line("."), col("."), 1), "name")
--
-- hi CursorLine guibg=#2d364f
-- hi PmenuSel blend=0
-- ]])
-- hi Cursor cterm=none gui=none guifg=#646466 ctermfg=black
-- hi Cursor guifg=#121212 guibg=#afd700

vim.cmd([[
set winminheight=0
hi WinSeparator guifg=#ffc4c4
hi Normal guibg=None
]])

