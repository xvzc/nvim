local lspconfig = require("lspconfig")
local common = require("plugins.nvim-lspconfig.common")

-- clangd config
local clangd_capabilities = vim.lsp.protocol.make_client_capabilities()
clangd_capabilities.textDocument.completion.completionItem.snippetSupport = true
clangd_capabilities.offsetEncoding = { "utf-16" }
lspconfig.clangd.setup {
  capabilities = clangd_capabilities,
  on_attach = common.on_attach,
  filetypes = { "c", "cpp" },
  cmd = {
    'clangd',
    '-header-insertion=never',
  },
}
