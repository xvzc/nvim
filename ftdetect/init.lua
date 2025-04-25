-- no comment when adding a new line from a commented line
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  callback = function()
    vim.opt_local.formatoptions:remove({"c", "r", "o"})
  end
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*/etc/nginx/*', '*/usr/local/nginx/conf/*', 'nginx.conf', '*.nginx', },
  callback = function()
    vim.bo.filetype = 'nginx'
  end
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = 'Dockerfile.*',
  callback = function()
    vim.bo.filetype = 'dockerfile'
  end
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.snippets',
  callback = function()
    vim.o.filetype = 'snippets'
  end
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*/.ssh/config.d/*',
  callback = function()
    vim.o.filetype = 'sshconfig'
  end
})
