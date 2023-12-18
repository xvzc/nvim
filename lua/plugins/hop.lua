local hop = require('hop')
local directions = require('hop.hint').HintDirection

hop.setup {
  keys = 'hklyuiopnmqwertzxcvbasdgjf',
  teasing = false
}

-- Keymaps
local opts = { silent = true, noremap = true }
vim.keymap.set('n', '<leader>f', function()
  hop.hint_char1()
end, opts)

vim.keymap.set('n', '<leader><leader>f', function()
  hop.hint_char2({})
end, opts)
