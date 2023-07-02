local profile = require('profile')
require('skeleton').setup({
  template_path = vim.fn.stdpath('config') .. '/templates',
  tags = {
    author = profile.author
  }
})
