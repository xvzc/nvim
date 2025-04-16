local lspconfig = require("lspconfig")
local common = require("plugins.lsp.lspconfig.common")

-- python config
lspconfig.bashls.setup({
	capabilities = common.capabilities,
	on_attach = common.on_attach,
  handlers = common.handlers,
})
