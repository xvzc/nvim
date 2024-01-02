require("kanagawa").setup({
	compile = true, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls,
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true, bold = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = { -- add/modify theme and palette colors
		palette = {
			samuraiRed = "#d1494d",
			surimiOrange = "#de8752",
			peachRed = "#f081c4",
		},
		theme = {
			wave = {},
			lotus = {},
			dragon = {},
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
	theme = "wave", -- Load "wave" theme when 'background' option is not set
})

-- setup must be called before loading
vim.cmd([[colorscheme kanagawa]])
-- vim.cmd([[highlight Normal guibg=none]])
