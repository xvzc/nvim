local noice = require("noice")
noice.setup({
	routes = {
		{
			filter = {
				event = "msg_show",
				kind = "",
				find = "^/",
			},
			opts = { skip = true },
		},
	},
	messages = {
		-- NOTE: If you enable messages, then the cmdline is enabled automatically.
		-- This is a current Neovim limitation.
		enabled = false, -- enables the Noice messages UI
		view = "mini", -- default view for messages
		view_error = "mini", -- view for errors
		view_warn = "mini", -- view for warnings
		view_history = "popup", -- view for :messages
		view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
	},
	views = {
		cmdline_popup = {
			border = {
				style = "none",
				padding = { 2, 3 },
			},
			position = {
				row = 15,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
			filter_options = {},
			win_options = {
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
		split = {
			height = 30,
		},
	},

	commands = {
		errors = {
			-- options for the message history that you get with `:Noice`
			view = "popup",
			opts = { enter = true, format = "details" },
			filter = { error = true },
			filter_opts = { reverse = true },
		},
		all = {
			-- options for the message history that you get with `:Noice`
			view = "popup",
			opts = { enter = true, format = "details" },
			filter_opts = { reverse = true },
			filter = {
				any = {
					{ event = "notify" },
					{ error = true },
					{ warning = true },
					{ event = "msg_show", kind = { "" } },
					{ event = "lsp", kind = "message" },
				},
			},
		},
	},
})

vim.keymap.set("n", "<leader>ne", "<cmd>Noice errors<cr>", { silent = true })
vim.keymap.set("n", "<leader>na", "<cmd>Noice all<cr>", { silent = true })
vim.cmd([[highlight NoiceMini guibg=none]])
