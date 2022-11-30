local global = require('global')
local saga = require('lspsaga')
saga.init_lsp_saga({
  show_outline = {
    win_position = 'left',
  },

  code_action_lightbulb = {
    sign = false,
    virtual_text = true,
},
})
