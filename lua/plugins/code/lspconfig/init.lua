local lspconfig = require("lspconfig")

vim.diagnostic.config({
	float = {
		focusable = false,
		source = "always",
		border = "rounded",
		header = "",
		prefix = "",
	},
	virtual_text = false,
})

local signs = { Error = "󰅚", Warn = "󰀪", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	update_in_insert = false,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }

		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		vim.api.nvim_create_autocmd({ "CursorMoved" }, {
			callback = function()
				vim.lsp.buf.clear_references()
			end,
			buffer = 0,
		})

		vim.keymap.set("n", "<C-l>", "<cmd>GuardFmt<CR>", { noremap = true })

		vim.keymap.set("n", "gd", "<cmd>Lspsaga finder def<CR>", opts)
		vim.keymap.set("n", "gr", "<cmd>Lspsaga finder ref<CR>", opts)
		vim.keymap.set("n", "gi", "<cmd>Lspsaga finder imp<CR>", opts)

		vim.keymap.set("n", "<leader>gc", "<cmd>Lspsaga code_action<CR>", opts)
		vim.keymap.set("n", "<leader>i", "<cmd>Lspsaga show_line_diagnostics ++unfocus<CR>", opts)

		vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
		vim.keymap.set("n", "<leader>o", "<cmd>SymbolsOutline<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<F1>", vim.lsp.buf.signature_help, { noremap = true, silent = true })
	end,
})

local config_dir = vim.fn.stdpath("config") .. "/lua/plugins/code/lspconfig/languages"
for _, file in ipairs(vim.fn.readdir(config_dir, [[v:val =~ '\.lua$']])) do
	require("plugins.code.lspconfig.languages." .. file:gsub("%.lua$", ""))
end

-- until this issue solved: https://github.com/neovim/neovim/issues/20456
vim.cmd([[
augroup MyLuaHLBugFix
  autocmd!
  autocmd! ColorScheme,VimEnter * highlight! link luaParenError Normal | highlight! link luaError Normal
augroup END
]])
