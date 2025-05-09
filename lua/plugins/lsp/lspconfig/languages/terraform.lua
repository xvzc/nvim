local lspconfig = require("lspconfig")
local common = require("plugins.lsp.lspconfig.common")

-- terraform config
lspconfig.terraformls.setup({
	capabilities = common.capabilities,
	on_attach = common.on_attach,
  handlers = common.handlers,
	filetypes = { "tf", "hcl", "terraform" },
})
lspconfig.tflint.setup({
	capabilities = common.capabilities,
	on_attach = common.on_attach,
  handlers = common.handlers,
	filetypes = { "tf", "hcl", "terraform" },
})
