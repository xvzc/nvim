require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.prettier,
    require("null-ls").builtins.diagnostics.eslint,
    require("null-ls").builtins.completion.spell,
  },
  debounce = 250,
  debug = false,
  default_timeout = 1000,
})
