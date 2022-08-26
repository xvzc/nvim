vim.cmd('filetype plugin indent on')

vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
vim.g.lastplace_ignore_buftype = "quickfix,nofile,help"
vim.g.lastplace_open_folds = 0

require('plugins')
require('clipboard')
require('preferences')
require('keymaps')
require('styles')

