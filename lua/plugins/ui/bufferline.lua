local bufferline = require("bufferline")
require("bufferline").setup({
	options = {
		modified_icon = "●",
		show_close_icon = false,
		show_buffer_close_icons = true,
		left_trunc_marker = "",
		right_trunc_marker = "",
		-- tab_size = 20,
		diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
	},
	highlights = {
		indicator_selected = {
			fg = "#FFFFFF",
		},
	},
})

vim.keymap.set("n", "<leader>1", function()
	bufferline.go_to_buffer(1, true)
end, { silent = true })

vim.keymap.set("n", "<leader>2", function()
	bufferline.go_to_buffer(2, true)
end, { silent = true })

vim.keymap.set("n", "<leader>3", function()
	bufferline.go_to_buffer(3, true)
end, { silent = true })

vim.keymap.set("n", "<leader>4", function()
	bufferline.go_to_buffer(4, true)
end, { silent = true })

vim.keymap.set("n", "<leader>5", function()
	bufferline.go_to_buffer(5, true)
end, { silent = true })

vim.keymap.set("n", "<leader>6", function()
	bufferline.go_to_buffer(6, true)
end, { silent = true })

vim.keymap.set("n", "<leader>7", function()
	bufferline.go_to_buffer(7, true)
end, { silent = true })

vim.keymap.set("n", "<leader>8", function()
	bufferline.go_to_buffer(8, true)
end, { silent = true })

vim.keymap.set("n", "<leader>9", function()
	bufferline.go_to_buffer(9, true)
end, { silent = true })

vim.keymap.set("n", "<leader>0", function()
	bufferline.go_to_buffer(10, true)
end, { silent = true })

vim.keymap.set("n", "<leader>$", function()
	bufferline.go_to_buffer(-1, true)
end, { silent = true })

vim.keymap.set("n", "<leader>^", function()
	bufferline.go_to_buffer(1, true)
end, { silent = true })

vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", { silent = true })

vim.keymap.set("n", "<M-Tab>", "<cmd>BufferLineCycleNext<CR>", { silent = true })

vim.keymap.set("n", "<M-S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
