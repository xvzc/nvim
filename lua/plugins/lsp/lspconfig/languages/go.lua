local lspconfig = require("lspconfig")
local common = require("plugins.lsp.lspconfig.common")

-- golang config
lspconfig.gopls.setup({
	capabilities = common.capabilities,
	on_attach = common.on_attch,
})

lspconfig.golangci_lint_ls.setup({
	capabilities = common.capabilities,
	on_attach = common.on_attach,
  handlers = common.handlers,
})
