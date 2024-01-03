local lspconfig = require("lspconfig")
local common = require("plugins.code.lspconfig.common")

-- clangd config
local capabilities = vim.deepcopy(common.capabilities)

lspconfig.clangd.setup({
	filetypes = { "nix" },
	cmd = {
		"rnix-lsp",
	},
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		common.on_attach(client, bufnr)
		vim.keymap.set("n", "<C-l>", vim.lsp.buf.format)
	end,
})
