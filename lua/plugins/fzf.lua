vim.keymap.set('i', '<c-x><c-k>', '<plug>(fzf-complete-word)', { silent = true })
vim.keymap.set('i', '<c-x><c-f>', '<plug>(fzf-complete-path)', { silent = true })
vim.keymap.set('i', '<c-x><c-l>', '<plug>(fzf-complete-line)', { silent = true })

vim.keymap.set('o', '<leader>m', '<plug>(fzf-maps-o)', { silent = true })
vim.keymap.set('n', '<leader>m', '<plug>(fzf-maps-n)', { silent = true })
vim.keymap.set('x', '<leader>m', '<plug>(fzf-maps-x)', { silent = true })

vim.cmd([[

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


autocmd! FileType fzf set laststatus=0 noshowmode noruler |
      \ autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=? -complete=dir FZF
      \ call fzf#vim#files(<q-args>, 
      \ fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? FTemplate
      \ call fzf#run(
      \ fzf#wrap({ 'dir': '~/.config/nvim/templates', 'sink': function('LoadTemplate') }),
      \ <bang>0)

let g:template_dir = '~/.config/nvim/templates'

function! LoadTemplate(...)
  exe "0r ". a:1
  if v:shell_error != 0
    exe "%s/.*{{ _timestamp_ }}.*//"
  else
    let timestamp = strftime("%Y-%m-%d %a %H:%M")
    exe "%s/{{ _timestamp_ }}/". "Created by xvzc(Github), ". l:timestamp
  endif

  exe "%s/.*{{ _cursor_ }}.*/"
endfunction
]])
