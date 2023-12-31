local lspconfig = require("lspconfig")
local common = require("plugins.code.lspconfig.common")

-- typescript config
lspconfig.tsserver.setup({
	capabilities = common.capabilities,
	on_attach = function(client, bufnr)
		common.on_attach(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
	end,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	cmd = {
		"typescript-language-server",
		"--stdio",
	},
})
