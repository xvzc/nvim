local saga = require('lspsaga')

saga.setup({
  outline = {
    win_position = 'right',
    win_with = '',
    win_width = 30,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = '<CR>',
      expand_collapse = 'u',
      quit = '<ESC>',
    },
  },
  code_action = {
    num_shortcut = true,
    keys = {
      -- string |table type
      quit = '<ESC>',
      exec = '<CR>',
    },
  },
  diagnostic = {
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    keys = {
      exec_action = 'o',
      quit = '<ESC>',
      go_action = 'g'
    },
  },
  rename = {
    quit = '<ESC>',
    exec = '<CR>',
    mark = 'x',
    confirm = '<CR>',
    in_select = true,
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
  }
})
