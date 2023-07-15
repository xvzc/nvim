local saga = require('lspsaga')

saga.setup({
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
    mark = 'i',
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
      jump_to = 'p',
      expand_or_jump = '<CR>',
      vsplit = 'v',
      split = 's',
      quit = { 'q', '<ESC>' },
      close_in_preview = '<ESC>',
    },
  },
})
