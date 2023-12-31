require("neoconf").setup({
	import = {
		vscode = false, -- local .vscode/settings.json
		coc = false, -- global/local coc-settings.json
		nlsp = false, -- global/local nlsp-settings.nvim json settings
	},
})
