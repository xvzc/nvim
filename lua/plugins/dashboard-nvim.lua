local dashboard = require('dashboard')

local header = {
  '',
  '',
  '',
  '',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '',
}

local center = {
  {
    icon = '  ',
    desc = 'Recently Opened Files ',
    action = "lua require('fzf-lua').oldfiles({ prompt = '>', preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden', })",
  },
  {
    desc = '  Empty Buffer          ',
    action = 'enew',
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

dashboard.setup({
  theme = 'doom', --  theme is doom and hyper default is hyper
  config = {
    header = header,
    center = center,
  }
})
