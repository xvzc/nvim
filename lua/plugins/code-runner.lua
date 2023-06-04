local code_runner = require('code_runner')
local util = require('util')

vim.cmd [[
hi CodeRunner guifg=#D0C8C8 guibg=#1C2219
hi CodeRunnerBorder guifg=#949693 guibg=#1C2219
]]

local filetypes = {
  python = "python3 -u",
  typescript = "yarn run ts-node",
  rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
  cpp = {
    "cd $dir",
    "&&",
    "g++ -std=c++17 -O2 -Wall -Wno-sign-compare -DLOCAL",
    "$fileName -o $fileNameWithoutExt",
    "&&",
    "$dir/$fileNameWithoutExt",
    "&&",
    "rm $dir/$fileNameWithoutExt",
  },
  sh = "bash",
  terraform = "terraform plan $end",
  go = "go run ./..."
}

function filetypes.stringify()
  for k, v in pairs(filetypes) do
    if type(v) == 'table' then
      local command = table.concat(v, " ")
      filetypes[k] = command
    end
  end

  return filetypes
end

local ok, project = pcall(require, "project")
if not ok then
  project = {}
end

code_runner.setup({
  -- mode = 'float',
  -- float = {
  --   border = "solid",
  --   float_hl = "CodeRunner",
  --   border_hl = "CodeRunnerBorder",
  -- },
  -- choose default mode (valid term, tab, float, toggle, buf)
  mode = 'term',
  focus = true,
  startinsert = true,
  term = {
    position = "bot",
    size = 15,
  },
  filetype_path = "",
  project_path = "",
  filetype = filetypes.stringify(),
  project = project,
})

local buf_opts = { noremap = true, silent = true }
util.nmap('<C-M-r>', ':w<CR>:RunCode<CR>', buf_opts)
