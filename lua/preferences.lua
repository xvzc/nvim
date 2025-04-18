vim.g.mapleader = " "

vim.o.swapfile = false
vim.o.undofile = true
vim.o.encoding = "UTF-8"

vim.o.foldmethod = "indent"
vim.o.foldlevel = 99

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.winminheight = 0

vim.o.mousehide = true -- Hide the mouse cursor while typing

vim.o.termguicolors = true
vim.o.laststatus = 3

vim.o.conceallevel = 1
vim.g.tex_conceal = "amd"

-- vim.o.whichwrap = "lh"
-- vim.o.background = 'dark'

vim.o.cindent = true -- C sytle auto indent

vim.o.scrolloff = 2
vim.o.shiftwidth = 4

vim.o.expandtab = true

vim.o.tabstop = 4

vim.o.hlsearch = true -- Search highlight
vim.o.history = 1000
vim.o.updatetime = 250
vim.o.number = true
vim.o.relativenumber = true

-- gitgutter sign column
vim.o.signcolumn = "yes"
vim.o.pumheight = 10
vim.o.pumblend = 0
vim.opt.listchars = { space = "_", tab = ">~", trail = " " }

-- vim.o.noshowmode = true
vim.o.showtabline = 0

vim.o.cursorline = true

vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.mouse = "a"

vim.o.viminfo = "'100,<1000,s100,h"
-- '100 Marks will be remembered for the last 100 edited files.
-- <1000 Limits the number of lines saved for each register to 1000 lines; 
-- if a register contains more than 1000 lines, only the first 1000 lines are saved.
-- s100 Registers with more than 100 KB of text are skipped.
-- h Disables search highlighting when Vim starts.

vim.o.sol = false
vim.o.showmode = false
