local hop = require('hop')
local directions = require('hop.hint').HintDirection
local util = require('util')

hop.setup {
  keys = 'hklyuiopnmqwertzxcvbasdgjf',
  teasing = false
}

-- Keymaps
local opts = { silent = true, noremap = true }
util.nmap('<leader>f', function()
  hop.hint_char1()
end, opts)

util.nmap('<leader><leader>f', function()
  hop.hint_char2({})
end, opts)
