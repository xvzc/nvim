local null_ls = require('null-ls')
local util = require('util')

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.completion.spell,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.json_tool.with({
      fileypes = { "json" },
      generator_opts = {
        command = "python3",
        args = { "-m", "json.tool", "--no-ensure-ascii" },
        to_stdin = true,
      },
    })
  },
  debounce = 250,
  debug = false,
  default_timeout = 1000,
})

local do_format = function(bufnr)
  vim.lsp.buf.format({
    async = true,
    bufnr = bufnr,
  })
end

util.autocmd({ 'filetype' }, {
  pattern = 'json',
  callback = function()
    util.nmap(
      '<C-l>',
      do_format,
      { noremap = true, silent = true, }
    )
  end
})

