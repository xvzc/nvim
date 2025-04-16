local lspsaga = require('lspsaga')

lspsaga.setup({
  code_action = {
    num_shortcut = true,
    keys = {
      -- string |table type
      quit = '<ESC>',
      exec = '<CR>',
    },
  },
  diagnostic = {
    show_code_action = false,
    show_source = true,
    jump_num_shortcut = true,
    keys = {
      exec_action = 'o',
      quit = '<ESC>',
      go_action = 'g'
    },
  },
  rename = {
    in_select = true,
    keys = {
      mark = 'i',
      exec = '<CR>',
      quit = '<ESC>',
      go_action = 'g'
    },
  },
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = false,
  },
  symbol_in_winbar = {
    in_custom = true
  },
  colors = {
    --float window normal background color
    normal_bg = '#1d1536',
  },
  finder = {
    max_height = 0.5,
    min_width = 30,
    force_max_height = false,
    keys = {
      tabe = 't',
      toggle_or_open = {'<CR>', 'o'},
      vsplit = 'v',
      split = 's',
      quit = { 'q', '<ESC>' },
    },
  },
})

