local telescope = require("telescope")
local actions = require("telescope.actions")
local common = require("plugins.util.telescope.common")

local function merge_config(opts)
	opts.defaults = opts.defaults or {}
	opts.theme = opts.theme or {}
	return vim.tbl_deep_extend("force", opts.theme, opts.defaults)
end

local defaults = merge_config({
	theme = common.theme.bottom_pane(),
	defaults = {
		file_ignore_patterns = { "^snippets/" },
		results_title = false,
		preview_title = false,
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-s>"] = actions.cycle_previewers_next,
				["<C-a>"] = actions.cycle_previewers_prev,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim",
		},
	},
})

telescope.setup({
	defaults = defaults,
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

local config_dir = vim.fn.stdpath("config") .. "/lua/plugins/util/telescope/custom"
for _, file in ipairs(vim.fn.readdir(config_dir, [[v:val =~ '\.lua$']])) do
	require("plugins.util.telescope.custom." .. file:gsub("%.lua$", ""))
end

telescope.load_extension("fzf")
telescope.load_extension("skeleton")
telescope.load_extension("chezmoi")
telescope.load_extension("todo-comments")
