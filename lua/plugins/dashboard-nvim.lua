local db = require('dashboard')

db.custom_header = {
 ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
 ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
 ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
 ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
 ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
 ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
 '',
}


db.custom_center = {
  {
    icon = '  ',
    desc = 'Empty Buffer          ',
    action = 'enew',
  },
  {
    icon = '  ',
    desc = 'Recently Opened Files ',
    action = "lua require('fzf-lua').oldfiles({ prompt = '>', preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden', })",
  },
  {
    icon = 'ﳎ  ',
    desc = 'Home Directory        ',
    action = "lua require('fzf-lua').files({ cwd = '~', prompt = '>', preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden', })",
  },
  {
    icon = '  ',
    desc = 'Current Directory     ',
    action = "lua require('fzf-lua').files({ prompt = '>', preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden', })",
  },
  {
    icon = '  ',
    desc = 'Live Grep             ',
    action = "lua require('fzf-lua').live_grep({ prompt = '>', preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden', })",
  },
  {
    icon = '  ',
    desc = 'Commit History        ',
    action = "lua require('fzf-lua').git_commits({ prompt = '>', preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden', })",
  },
  {
    icon = '  ',
    desc = 'Configs               ',
    action = "lua require('fzf-lua').files({ cwd = '~/.config', prompt = '>', preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden', })",
  }
}

