local ft = require('guard.filetype')
local util = require('util')

-- Assuming you have guard-collection
ft('python'):fmt('black')
    :lint('pylint')

-- -- Call setup() LAST!
-- require('guard').setup({
--     -- the only options for the setup function
--     fmt_on_save = true,
--     -- Use lsp if no formatter was defined for this filetype
--     lsp_as_default_formatter = false,
-- })

require('guard').setup({
  -- the only options for the setup function
  fmt_on_save = false,
  -- Use lsp if no formatter was defined for this filetype
  lsp_as_default_formatter = true,
})

util.nmap('<C-l>', '<cmd>GuardFmt<CR>', { noremap = true, silent = true })