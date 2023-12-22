local ft = require('guard.filetype')

-- Assuming you have guard-collection
ft('python')
    :fmt('black')
    :lint({
      cmd = 'pylint',
    })

ft('cpp')
    :fmt({
      cmd = 'clang-format',
      args = { '-style=google' }
    })

ft('lua')
    :fmt('stylua')

ft('typescript,javascript,typescriptreact'):fmt('prettier'):lint("eslint_d")

require('guard').setup({
  -- the only options for the setup function
  fmt_on_save = true,
  -- Use lsp if no formatter was defined for this filetype
  lsp_as_default_formatter = true,
})
