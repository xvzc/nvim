local function config(str)
	return function()
		require(str)
	end
end

require("lazy").setup({
	performance = {
		cache = {
			enabled = true,
		},
	},
	-- ┌────────────┐
	-- │ EAGER LOAD │
	-- └────────────┘
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	"MunifTanjim/nui.nvim",
	{
		"rcarriga/nvim-notify",
		config = config("plugins.ui.notify"),
	},
	-- ┌──────┐
	-- │ CODE │
	-- └──────┘
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = config("plugins.code.dap"),
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = config("plugins.code.lspconfig"),
		dependencies = {
			{
				"williamboman/mason.nvim",
				config = config("plugins.code.mason"),
				dependencies = {
					{ "williamboman/mason-lspconfig.nvim" },
				},
			},
			{
				"folke/neoconf.nvim",
				event = "VeryLazy",
				config = config("plugins.code.neoconf"),
			},
			{
				"glepnir/lspsaga.nvim",
				branch = "main",
				event = "VeryLazy",
				config = config("plugins.code.lspsaga"),
			},
			-- { 'simrat39/rust-tools.nvim',     ft = { 'rust' } },
			{ "yuezk/vim-js", ft = { "js" } },
			{ "othree/yajs.vim", ft = { "js" } },
			{ "HerringtonDarkholme/yats.vim", ft = { "js" } },
			{ "maxmellon/vim-jsx-pretty", ft = { "jsx" } },
			{ "hashivim/vim-terraform", ft = { "tf", "terraform" } },
		},
	},
	{
		"nvim-neotest/neotest",
		config = config("plugins.code.neotest"),
		dependencies = {
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
		},
	},
	{
		"CRAG666/code_runner.nvim",
		priority = 1,
		event = "BufReadPre",
		config = config("plugins.util.code-runner"),
	},
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		config = config("plugins.code.null-ls"),
	},
	{
		"SirVer/ultisnips",
		config = config("plugins.code.ultisnips"),
	},
	{
		"hrsh7th/nvim-cmp",
		config = config("plugins.code.nvim-cmp"),
		-- event = "VeryLazy",
		dependencies = {
			{
				"windwp/nvim-autopairs",
				config = config("plugins.code.nvim-autopairs"),
			},
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "lukas-reineke/cmp-under-comparator" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
			{
				"quangnguyen30192/cmp-nvim-ultisnips",
				config = true,
			},
		},
	},
	-- ┌────┐
	-- │ UI │
	-- └────┘
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = config("plugins.ui.noice"),
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = config("plugins.ui.kanagawa"),
	},
	{
		"glepnir/dashboard-nvim",
		config = config("plugins.ui.dashboard-nvim"),
		event = "VimEnter",
	},
	{
		"akinsho/bufferline.nvim",
		config = config("plugins.ui.bufferline"),
		event = "VimEnter",
	},
	{
		"nvim-lualine/lualine.nvim",
		config = config("plugins.ui.lualine"),
		event = "VeryLazy",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		event = "VeryLazy",
		branch = "v2.x",
		config = config("plugins.ui.neo-tree"),
	},
	{
		"karb94/neoscroll.nvim",
		config = config("plugins.ui.neoscroll"),
		event = "VeryLazy",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "VeryLazy",
		config = config("plugins.ui.treesitter"),
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				-- dir = "~/_personal/nvim-treesitter-textobjects/",
			},
		},
	},
	{
		"simrat39/symbols-outline.nvim",
		event = "VeryLazy",
		config = config("plugins.ui.symbols-outline"),
	},
	{
		"lewis6991/gitsigns.nvim",
		config = config("plugins.ui.gitsigns"),
		event = "VeryLazy",
	},
	-- ┌──────┐
	-- │ UTIL │
	-- └──────┘
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "godlygeek/tabular", event = "VeryLazy" },
	{
		"xvzc/chezmoi.nvim",
		dir = "~/_personal/chezmoi.nvim/",
		-- event = "BufReadPre",
		config = config("plugins.util.chezmoi"),
	},
	{
		"numToStr/Comment.nvim",
		config = true,
		event = "VeryLazy",
	},
	{
		"phaazon/hop.nvim",
		config = config("plugins.util.hop"),
		event = "VeryLazy",
	},
	{
		"xvzc/skeleton.nvim",
		-- dir = "~/_personal/skeleton.nvim/",
		config = config("plugins.util.skeleton"),
		event = "VeryLazy",
	},
	{
		"kdheepak/lazygit.nvim",
		config = config("plugins.util.lazygit"),
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		config = config("plugins.util.telescope"),
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = config("plugins.util.nvim-surround"),
	},
	{
		"akinsho/toggleterm.nvim",
		-- 'voldikss/vim-floaterm',
		config = config("plugins.util.toggleterm"),
		event = "VeryLazy",
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		config = config("plugins.util.todo-comments"),
	},
	-- ┌──────┐
	-- │ MISC │
	-- └──────┘
	{
		"andweeb/presence.nvim",
		event = "BufWinEnter",
		config = config("plugins.misc.presence"),
	},
	{
		"keaising/im-select.nvim",
		event = "VeryLazy",
		config = config("plugins.misc.im-select"),
	},
	{
		"farmergreg/vim-lastplace",
		config = config("plugins.misc.vim-lastplace"),
	},
})
