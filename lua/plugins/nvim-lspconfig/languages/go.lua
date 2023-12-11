local lspconfig = require("lspconfig")
local common = require("plugins.nvim-lspconfig.common")

-- golang config
lspconfig.gopls.setup {
  capabilities = common.capabilities,
  on_attach = common.on_attach,
}

lspconfig.golangci_lint_ls.setup {
  capabilities = common.capabilities,
  on_attach = common.on_attach,
}
