local null_ls = require('null-ls')

local diagnostics = {
  null_ls.builtins.diagnostics.eslint_d.with {}
}

local formatting = {
  null_ls.builtins.formatting.prettierd.with {
    disabled_filetypes = { "json" }
  },
  null_ls.builtins.formatting.json_tool.with {
    fileypes = { "json" },
    generator_opts = {
      command = "python3",
      args = { "-m", "json.tool", "--no-ensure-ascii", "--indent=2" },
      to_stdin = true,
    },
  },
  null_ls.builtins.formatting.gofmt.with {},
  null_ls.builtins.formatting.goimports.with {},
  null_ls.builtins.formatting.sqlfluff.with {},
}

local code_actions = {
  null_ls.builtins.code_actions.gomodifytags.with {},
}

local completion = {
  null_ls.builtins.completion.spell.with {},
}

null_ls.setup {
  on_attach = require('plugins.nvim-lspconfig').on_attach,
  sources = require('util').table_merge(formatting, completion, diagnostics, code_actions),
  debounce = 250,
  debug = false,
  default_timeout = 1000,
}
