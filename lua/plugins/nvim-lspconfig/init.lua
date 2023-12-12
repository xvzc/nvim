require('lspconfig')

vim.diagnostic.config({
  float = {
    focusable = false,
    source = 'always',
    border = 'rounded',
    header = '',
    prefix = '',
  },
  virtual_text = false
})

local signs = { Error = "󰅚", Warn = "󰀪", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    update_in_insert = false,
  })

local config_dir = vim.fn.stdpath "config" .. "/lua/plugins/nvim-lspconfig/languages"
for _, file in ipairs(vim.fn.readdir(config_dir, [[v:val =~ '\.lua$']])) do
  require('plugins.nvim-lspconfig.languages.' .. file:gsub('%.lua$', ''))
end

-- until this issue solved: https://github.com/neovim/neovim/issues/20456
vim.cmd [[
augroup MyLuaHLBugFix
  autocmd!
  autocmd! ColorScheme,VimEnter * highlight! link luaParenError Normal | highlight! link luaError Normal
augroup END
]]
