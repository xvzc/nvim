local profile = require('profile')
require('template').setup({
  temp_dir = vim.fn.stdpath('config') .. '/templates',
  author = profile.author,
  email = nil
})
