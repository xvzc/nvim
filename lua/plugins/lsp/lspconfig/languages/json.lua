local lspconfig = require("lspconfig")
local common = require("plugins.lsp.lspconfig.common")

lspconfig.jsonls.setup({
	capabilities = common.capabilities,
	on_attach = function(client, bufnr)
		common.on_attach(client, bufnr)
	end,
  handlers = common.handlers,
})
