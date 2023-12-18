local silent_noremap = { silent = true, noremap = true }

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '**/algorithm/boj/*' },
  callback = function()
    vim.keymap.set('n', 
      '<C-M-s>',
      ':!boj submit',
      silent_noremap)
  end
})

