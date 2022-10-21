vim.cmd('filetype plugin indent on')

local ok, _ = pcall(require, "impatient")
if not ok then
  print('impatient is not installed. run :PackerInstall')
end

require('plugins')
require('clipboard')
require('preferences')
require('keymaps')
require('styles')
