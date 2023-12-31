local lspconfig = require("lspconfig")
local common = require("plugins.code.lspconfig.common")

-- terraform config
lspconfig.terraformls.setup({
	capabilities = common.capabilities,
	on_attach = common.on_attach,
	filetypes = { "tf", "hcl", "terraform" },
})
lspconfig.tflint.setup({
	capabilities = common.capabilities,
	on_attach = common.on_attach,
	filetypes = { "tf", "hcl", "terraform" },
})
