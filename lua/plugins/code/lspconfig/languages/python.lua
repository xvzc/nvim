local lspconfig = require("lspconfig")
local common = require("plugins.code.lspconfig.common")

local pylint_ignore = {
	"missing-module-docstring",
	"missing-function-docstring",
	"too-many-branches",
}

-- python config
lspconfig.pylsp.setup({
	capabilities = common.capabilities,
	on_attach = common.on_attach,
	settings = {
		pylsp = {
			plugins = {
				black = { enabled = true },
				pyflakes = { enabled = false },
				flake8 = {
					enabled = true,
				},
			},
		},
	},
})
