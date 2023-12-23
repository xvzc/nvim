require("lazy").setup({
  performance = {
    cache = {
      enabled = true,
    },
  },
  { 'nvim-lua/plenary.nvim', },
  {
    'lewis6991/impatient.nvim',
    config = function() pcall(require, "impatient") end
  },
  {
    'williamboman/mason.nvim',
    config = function() require('plugins.mason') end,
    priority = 1000,
    dependencies = {
      { "williamboman/mason-lspconfig.nvim", },
    }
  },
  {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig') end,
    dependencies = {
      {
        "glepnir/lspsaga.nvim",
        branch = "main",
        event = "VeryLazy",
        config = function() require('plugins.lspsaga') end,
      },
      {
        'simrat39/symbols-outline.nvim',
        event = "VeryLazy",
        config = function() require('plugins.symbols-outline') end,
      },
      {
        "smjonas/inc-rename.nvim",
        event = "VeryLazy",
        config = function() require('inc_rename').setup() end,
      },
      { "nvim-tree/nvim-web-devicons",  event = "VeryLazy" },
      -- { 'simrat39/rust-tools.nvim',     ft = { 'rust' } },
      { 'yuezk/vim-js',                 ft = { 'js' } },
      { 'othree/yajs.vim',              ft = { 'js' } },
      { 'HerringtonDarkholme/yats.vim', ft = { 'js' } },
      { 'maxmellon/vim-jsx-pretty',     ft = { 'jsx' } },
      { 'iamcco/markdown-preview.nvim', ft = { 'md' }, },
      { 'hashivim/vim-terraform',       ft = { 'tf', 'terraform' }, },
    }
  },
  {
    "nvimdev/guard.nvim",
    event = "VeryLazy",
    config = function() require('plugins.guard') end,
    dependencies = {
      "nvimdev/guard-collection",
    },
  },
  -- ┌─────────────────┐
  -- │ AUTO COMPLETION │
  -- └─────────────────┘
  {
    'SirVer/ultisnips',
    config = function() require('plugins.ultisnips') end,
  },
  {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.nvim-cmp') end,
    event = 'VeryLazy',
    dependencies = {
      {
        'windwp/nvim-autopairs',
        config = function()
          require('plugins.nvim-autopairs')
        end,
      },
      { 'hrsh7th/cmp-buffer', },
      { 'hrsh7th/cmp-nvim-lsp', },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', },
      { 'hrsh7th/cmp-path', },
      { 'hrsh7th/cmp-nvim-lua', },
      { 'lukas-reineke/cmp-under-comparator', },
      { 'hrsh7th/cmp-cmdline', },
      { 'hrsh7th/cmp-nvim-lsp-document-symbol', },
      {
        'quangnguyen30192/cmp-nvim-ultisnips',
        config = function() require('cmp_nvim_ultisnips').setup {} end,
      },
    }
  },
  -- ┌────────────────────┐
  -- │ SYNTAX / LANGUAGES │
  -- └────────────────────┘
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "VeryLazy",
    config = function() require('plugins.treesitter') end,
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dir = "~/_personal/nvim-treesitter-textobjects/"
      },
      { 'nvim-treesitter/playground' }
    }
  },
  -- ┌───────┐
  -- │ THEME │
  -- └───────┘
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function() require('plugins.kanagawa') end,
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function() require('plugins.catpuccin') end,
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   priority = 1000,
  -- },
  -- {
  --   'morhetz/gruvbox',
  --   priority = 1000,
  -- },
  -- ┌───────┐
  -- │ UTILS │
  -- └───────┘
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = function()
      require("scrollbar").setup()
    end
  },
  {
    'xvzc/chezmoi.nvim',
    -- dir = "~/_jry/chezmoi.nvim/",
    event = "VeryLazy",
    config = function() require('plugins.chezmoi') end,
  },
  {
    'rcarriga/nvim-notify',
    config = function() vim.notify = require("notify") end,
  },
  {
    "keaising/im-select.nvim",
    event = "VeryLazy",
    config = function() require('plugins.im-select') end,
  },
  {
    'farmergreg/vim-lastplace',
    config = function() require('plugins.vim-lastplace') end,
  },
  {
    'xvzc/skeleton.nvim',
    config = function() require('plugins.skeleton') end,
    event = "VeryLazy"
  },
  {
    'glepnir/dashboard-nvim',
    config = function() require('plugins.dashboard-nvim') end,
    event = "VimEnter"
  },
  {
    'numToStr/Comment.nvim',
    config = function() require('plugins.comment') end,
    event = "VeryLazy",
  },
  { 'tpope/vim-fugitive',    event = 'VeryLazy', },
  { 'godlygeek/tabular',     event = 'VeryLazy', },
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.gitsigns') end,
    event = "VeryLazy",
  },
  {
    'phaazon/hop.nvim',
    config = function() require('plugins.hop') end,
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function() require("plugins.nvim-surround") end
  },
  {
    'kdheepak/lazygit.nvim',
    config = function() require('plugins.lazygit') end,
    event = "VeryLazy",
  },
  {
    'akinsho/toggleterm.nvim',
    -- 'voldikss/vim-floaterm',
    config = function() require('plugins.toggleterm') end,
    event = "VeryLazy",
  },
  {
    'karb94/neoscroll.nvim',
    config = function() require('plugins.neoscroll') end,
    event = "VeryLazy",
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    'akinsho/bufferline.nvim',
    config = function() require('plugins.bufferline') end,
    event = "VimEnter",
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function() require('plugins.lualine') end,
    event = "VeryLazy",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    branch = "v2.x",
    config = function() require('plugins.neo-tree') end,
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = require('plugins.todo-comments')
  },
  {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    config = function() require('plugins.telescope') end,
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },
  {
    'CRAG666/code_runner.nvim',
    event = "VeryLazy",
    config = function() require('plugins.code-runner') end,
  },
})
