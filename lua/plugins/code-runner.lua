local code_runner = require('code_runner')

vim.cmd [[
hi CodeRunner guifg=#D0C8C8 guibg=#1C2219
hi CodeRunnerBorder guifg=#949693 guibg=#1C2219
]]

local filetype = {
  typescript = "yarn run ts-node",
  rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
  cpp = function()
    if string.find(vim.api.nvim_buf_get_name(0), "/algorithms/boj") then
      return "boj run $fileName"
    end

    local commands = {
      "cd $dir",
      "&&",
      "g++ -std=c++17 -O2 -Wall -Wno-sign-compare -DLOCAL",
      "$fileName -o $fileNameWithoutExt",
      "&&",
      "$dir/$fileNameWithoutExt &&",
      "rm $dir/$fileNameWithoutExt",
    }

    return table.concat(commands, " ")
  end,
  -- cpp = {
  --   "cd $dir &&",
  --   "g++ -std=c++17 -O2 -Wall -Wno-sign-compare -DLOCAL $fileName -o $fileNameWithoutExt &&",
  --   "$dir/$fileNameWithoutExt &&",
  --   "rm $dir/$fileNameWithoutExt",
  -- },
  zsh = "zsh",
  sh = "bash",
  terraform = "terraform plan $end",
  go = "go run ./..."
}

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
  filetype = filetype,
  project = project,
})

vim.keymap.set('n', '<C-M-r>', ':w<CR>:RunCode<CR>', { silent = true })
