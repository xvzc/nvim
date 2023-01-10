local util = require('util')
local profile = require('profile')

vim.g.mapleader = ' '
vim.o.undofile = true
vim.o.encoding = 'UTF-8'
vim.o.tenc = 'UTF-8' -- terminal's encoding

vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.mousehide = true -- Hide the mouse cursor while typing

vim.o.termguicolors = true

vim.o.conceallevel = 1
vim.o.background = 'dark'

vim.o.cindent = true -- C sytle auto indent

vim.o.scrolloff = 2
vim.o.shiftwidth = 4

vim.o.expandtab = true

vim.o.tabstop = 4

vim.o.hlsearch = true -- Search highlight
vim.o.history = 1000
vim.o.updatetime = 250
vim.o.number = true

-- gitgutter sign column
vim.o.signcolumn = 'yes'
vim.o.pumheight = 10
vim.o.pumblend = 13

-- vim.o.noshowmode = true
vim.o.showtabline = 0

vim.o.cursorline = true

vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.mouse = ''
vim.o.viminfo = "'100,<1000,s100,h"

vim.o.sol = false
vim.o.showmode = false

vim.o.backupdir = profile.home .. '/.local/share/nvim/backup//'
vim.o.directory = profile.home .. '/.local/share/nvim/backup//'
vim.o.undodir = profile.home .. '/.local/share/nvim/undo//'

-- no comment when adding a new line from a commented line
vim.cmd 'autocmd BufNewFile,BufRead * setlocal formatoptions-=cro'

util.autocmd({ 'FileType' }, {
  pattern = { 'vim', 'zsh', 'lua', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'sh' },
  callback = function()
    vim.cmd('set shiftwidth=2 tabstop=2')
  end
})

util.autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*/etc/nginx/*', '*/usr/local/nginx/conf/*', 'nginx.conf', '*.nginx', },
  callback = function()
    vim.cmd('set ft=nginx')
  end
})

util.autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = 'Dockerfile.*',
  callback = function()
    vim.cmd('set ft=dockerfile')
  end
})

