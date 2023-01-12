local code_runner = require('code_runner')
local util = require('util')

local cpp_command = "cd $dir && "
cpp_command = cpp_command .. "g++ -std=c++17 -O2 -Wall -Wno-sign-compare -DLOCAL "
cpp_command = cpp_command .. "$fileName -o $fileNameWithoutExt && "
cpp_command = cpp_command .. "$dir/$fileNameWithoutExt &&"
cpp_command = cpp_command .. "rm $dir/$fileNameWithoutExt"

code_runner.setup({
  mode = 'term',
  filetype = {
    python = "python3 -u",
    typescript = "deno run",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
    cpp = cpp_command,
    sh = "bash",
  },
  filetype_path = vim.fn.expand('~/.config/nvim/code_runner.json'),
  project_path = vim.fn.expand('~/.config/nvim/project_manager.json')
})

local buf_opts = { noremap = true, silent = true}
util.nmap('<leader>r', ':w<CR>:RunCode<CR>', buf_opts)
