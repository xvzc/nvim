local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.completion.spell,
    null_ls.builtins.formatting.black,
  },
  debounce = 250,
  debug = false,
  default_timeout = 1000,
})
