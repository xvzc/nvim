local util = require('util')

require("nvim-surround").setup {
  -- Configuration here, or leave empty to use defaults
}

vim.cmd('nmap <leader>s ysiw') -- somehow not working with pure lua ..
vim.cmd('vmap <leader>s S')

