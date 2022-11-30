local global = require('global')
local saga = require('lspsaga')

saga.init_lsp_saga({
  show_outline = {
    win_position = 'left',
  },
  code_action_lightbulb = {
    sign = true,
    virtual_text = false,
  },
  -- symbol_in_winbar = {
  --   in_custom = true
  -- }
})


