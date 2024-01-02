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
	"rcarriga/nvim-notify",
	-- ┌──────┐
	-- │ CODE │
	-- └──────┘
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			require("plugins.code.dap")
		end,
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.code.lspconfig")
		end,
		dependencies = {
			{
				"williamboman/mason.nvim",
				config = function()
					require("plugins.code.mason")
				end,
				dependencies = {
					{ "williamboman/mason-lspconfig.nvim" },
				},
			},
			{
				"folke/neoconf.nvim",
				event = "VeryLazy",
				config = function()
					require("plugins.code.neoconf")
				end,
			},
			{
				"glepnir/lspsaga.nvim",
				branch = "main",
				event = "VeryLazy",
				config = function()
					require("plugins.code.lspsaga")
				end,
			},
			{
				"smjonas/inc-rename.nvim",
				event = "VeryLazy",
				config = function()
					require("inc_rename").setup()
				end,
			},
			-- { 'simrat39/rust-tools.nvim',     ft = { 'rust' } },
			{ "yuezk/vim-js", ft = { "js" } },
			{ "othree/yajs.vim", ft = { "js" } },
			{ "HerringtonDarkholme/yats.vim", ft = { "js" } },
			{ "maxmellon/vim-jsx-pretty", ft = { "jsx" } },
			{ "hashivim/vim-terraform", ft = { "tf", "terraform" } },
			{
				"iamcco/markdown-preview.nvim",
				cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
				ft = { "markdown" },
				build = function()
					vim.fn["mkdp#util#install"]()
				end,
			},
		},
	},
	{
		"nvim-neotest/neotest",
		config = function()
			require("plugins.code.neotest")
		end,
		dependencies = {
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
		},
	},
	{
		"CRAG666/code_runner.nvim",
		priority = 1,
		event = "VeryLazy",
		config = function()
			require("plugins.util.code-runner")
		end,
	},
	{
		"nvimdev/guard.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.code.guard")
		end,
		dependencies = {
			"nvimdev/guard-collection",
		},
	},
	{
		"SirVer/ultisnips",
		config = function()
			require("plugins.code.ultisnips")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.code.nvim-cmp")
		end,
		-- event = "VeryLazy",
		dependencies = {
			{
				"windwp/nvim-autopairs",
				config = function()
					require("plugins.code.nvim-autopairs")
				end,
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
		config = function()
			require("plugins.ui.noice")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("plugins.ui.kanagawa")
		end,
	},
	{
		"glepnir/dashboard-nvim",
		config = function()
			require("plugins.ui.dashboard-nvim")
		end,
		event = "VimEnter",
	},
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.ui.bufferline")
		end,
		event = "VimEnter",
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.ui.lualine")
		end,
		event = "VeryLazy",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		event = "VeryLazy",
		branch = "v2.x",
		config = function()
			require("plugins.ui.neo-tree")
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("plugins.ui.neoscroll")
		end,
		event = "VeryLazy",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "VeryLazy",
		config = function()
			require("plugins.ui.treesitter")
		end,
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
		config = function()
			require("plugins.ui.symbols-outline")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.ui.gitsigns")
		end,
		event = "VeryLazy",
	},
	-- ┌──────┐
	-- │ UTIL │
	-- └──────┘
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
      require("plugins.util.chatgpt")
		end,
	},
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "godlygeek/tabular", event = "VeryLazy" },
	{
		"xvzc/chezmoi.nvim",
		-- dir = "~/_personal/chezmoi.nvim/",
		event = "VeryLazy",
		config = function()
			require("plugins.util.chezmoi")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = true,
		event = "VeryLazy",
	},
	{
		"phaazon/hop.nvim",
		config = function()
			require("plugins.util.hop")
		end,
		event = "VeryLazy",
	},
	{
		"xvzc/skeleton.nvim",
		-- dir = "~/_personal/skeleton.nvim/",
		config = function()
			require("plugins.util.skeleton")
		end,
		event = "VeryLazy",
	},
	{
		"kdheepak/lazygit.nvim",
		config = function()
			require("plugins.util.lazygit")
		end,
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.util.telescope")
		end,
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("plugins.util.nvim-surround")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		-- 'voldikss/vim-floaterm',
		config = function()
			require("plugins.util.toggleterm")
		end,
		event = "VeryLazy",
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		opts = require("plugins.util.todo-comments"),
	},
	-- ┌──────┐
	-- │ MISC │
	-- └──────┘
	{
		"andweeb/presence.nvim",
		event = "BufWinEnter",
		config = function()
			require("plugins.misc.presence")
		end,
	},
	{
		"keaising/im-select.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.misc.im-select")
		end,
	},
	{
		"farmergreg/vim-lastplace",
		config = function()
			require("plugins.misc.vim-lastplace")
		end,
	},
})
