vim.cmd([[
colorscheme tokyonight

hi Comment ctermfg=14 gui=italic guifg=#6b806e

command! -bang -nargs=? -complete=dir HiGroup
\ echo synIDattr(synID(line("."), col("."), 1), "name")

hi CursorLine guibg=#3d4740
hi DiagnosticError guibg=none ctermbg=none
hi CursorLineNr guibg=#3d4740

hi PmenuSel blend=0
]])
-- hi Cursor cterm=none gui=none guifg=#646466 ctermfg=black
-- hi Cursor guifg=#121212 guibg=#afd700

