require("chezmoi").setup({
	edit = {
		watch = true,
		force = true,
	},
	notification = {
		on_open = false,
		on_save = true,
		on_watch = true,
	},
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
	callback = function()
    vim.schedule(require("chezmoi.commands.__edit").watch)
	end,
})
