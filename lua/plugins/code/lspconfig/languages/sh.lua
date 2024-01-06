local lspconfig = require("lspconfig")
local common = require("plugins.code.lspconfig.common")

-- python config
lspconfig.bashls.setup({
	capabilities = common.capabilities,
	on_attach = common.on_attach,
})
