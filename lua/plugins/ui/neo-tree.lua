require("neo-tree").setup({
	close_if_last_window = true,
	enable_diagnostics = false,
	sort_function = nil,
	default_component_configs = {
		-- icon = {
		-- 	folder_closed = "",
		-- 	folder_open = "",
		-- 	folder_empty = "",
		-- 	default = "*",
		-- 	highlight = "NeoTreeFileIcon",
		-- },
		modified = {
			symbol = "",
			highlight = "NeoTreeModified",
		},
		git_status = {
			symbols = {
				added = "✚",
				modified = "",
				unstaged = "*",
			},
		},
	},

	window = {
		width = 35,
		mappings = {
			["o"] = "open",
			["h"] = "navigate_up",
			["."] = "none",
			["<Tab>"] = "set_root",
			["l"] = {
				"toggle_node",
				nowait = true, -- disable `nowait` if you have existing combos starting with this char that you want to use
			},
		},
		commands = {
			sync_root = function(state)
				vim.notify(vim.inspect(state))
			end,
		},
	},
	filesystem = {
		bind_to_cwd = true,
		filtered_items = {
			hide_by_name = {
				"node_modules",
			},
			never_show = {
				".DS_Store",
			},
		},
		follow_current_file = false,
		group_empty_dirs = false,
		window = {
			mappings = {
				["D"] = "none",
				["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
			},
		},
	},
	buffers = {
		follow_current_file = true,
		group_empty_dirs = true,
		show_unloaded = true,
	},
	git_status = {
		window = {
			position = "float",
		},
	},
})

vim.keymap.set("n", "<leader>e", function()
	require("neo-tree.command").execute({
		toggle = true,
	})
end, { silent = true })
