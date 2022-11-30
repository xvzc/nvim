local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.json_tool.with({
      generator_opts = {
        command = "python3",
        args = { "-m", "json.tool", "--no-ensure-ascii" },
        to_stdin = true,
      },
    }),
    null_ls.builtins.completion.spell,
  },
  debounce = 250,
  debug = false,
  default_timeout = 1000,
})
