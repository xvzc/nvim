local code_runner = require('code_runner')
local util = require('util')

vim.cmd[[
hi CodeRunner guifg=#D0C8C8 guibg=#1C2219
hi CodeRunnerBorder guifg=#949693 guibg=#1C2219
]]

code_runner.setup({
  mode = 'float',
  float ={
    border = "solid",
    float_hl = "CodeRunner",
    border_hl = "CodeRunnerBorder"
  },
  filetype_path = vim.fn.expand('~/.config/nvim/code-runner.json'),
  project_path = vim.fn.expand('~/.config/nvim/project-runner.json')
})

local buf_opts = { noremap = true, silent = true}
util.nmap('<C-M-r>', ':w<CR>:RunCode<CR>', buf_opts)
