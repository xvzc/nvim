local packer = nil
local profile = require('profile')
local util = require('packer.util')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'

  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.nvim-lspconfig') end,
    event = 'BufWinEnter',
  }
  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function() require('plugins.lspsaga') end,
    event = 'BufWinEnter',
    after = 'mason.nvim'
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function() require('plugins.null-ls') end,
    event = 'BufWinEnter',
    after = 'mason.nvim'
  }
  use {
    'williamboman/mason.nvim',
    event = "BufWinEnter",
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    config = function() require('plugins.mason') end,
    after = 'mason.nvim'
  }

  ---------------------------------------------------
  -- AUTO COMPLETION                               --
  ---------------------------------------------------
  use {
    'SirVer/ultisnips',
    config = function() require('plugins.ultisnips') end,
    event = 'VimEnter',
  }
  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.nvim-cmp') end,
    event = 'VimEnter',
  }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.nvim-autopairs')
    end,
    after = 'nvim-cmp',
  }
  use {
    'hrsh7th/cmp-buffer',
    after = 'nvim-cmp',
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    after = 'nvim-cmp',
  }
  use {
    'hrsh7th/cmp-nvim-lsp-signature-help',
    after = 'nvim-cmp',
  }
  use {
    'hrsh7th/cmp-path',
    after = 'nvim-cmp',
  }
  use {
    'hrsh7th/cmp-nvim-lua',
    after = 'nvim-cmp',
  }
  use {
    'lukas-reineke/cmp-under-comparator',
    after = 'nvim-cmp',
  }
  use {
    'hrsh7th/cmp-cmdline',
    after = 'nvim-cmp',
  }
  use {
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    after = 'nvim-cmp',
  }
  use {
    'quangnguyen30192/cmp-nvim-ultisnips',
    config = function() require('cmp_nvim_ultisnips').setup {} end,
    after = 'nvim-cmp',
  }

  ---------------------------------------------------
  -- SYNTAX                                        --
  ---------------------------------------------------
  -- use { 'fatih/vim-go', ft = { 'go' } }
  use { 'yuezk/vim-js', ft = { 'js' } }
  use { 'othree/yajs.vim', ft = { 'js' } }
  use { 'HerringtonDarkholme/yats.vim', ft = { 'js' } }
  use { 'maxmellon/vim-jsx-pretty', ft = { 'jsx' } }
  use { 'iamcco/markdown-preview.nvim', ft = { 'md' }, }
  use { 'hashivim/vim-terraform', ft = { 'tf', 'terraform' }, }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = 'VimEnter',
    config = function() require('plugins.treesitter') end,
  }

  ---------------------------------------------------
  -- THEME                                         --
  ---------------------------------------------------
  use 'folke/tokyonight.nvim'
  use 'morhetz/gruvbox'

  ---------------------------------------------------
  -- UTILS                                         --
  ---------------------------------------------------
  use {
    'xvzc/skeleton.nvim',
    config = function() require('plugins.skeleton') end,
  }
  use {
    'farmergreg/vim-lastplace',
    config = function() require('plugins.vim-lastplace') end,
    event = "BufWinEnter",
  }
  use {
    'glepnir/dashboard-nvim',
    config = function() require('plugins.dashboard-nvim') end,
    event = "VimEnter"
  }
  use {
    'numToStr/Comment.nvim',
    event = 'VimEnter',
    config = function() require('plugins.comment') end,
  }
  use { 'tpope/vim-fugitive', event = 'VimEnter', }
  use { 'godlygeek/tabular', event = 'VimEnter', }
  use {
    'lewis6991/gitsigns.nvim',
    event = 'VimEnter',
    config = function() require('plugins.gitsigns') end,
  }
  use {
    'easymotion/vim-easymotion',
    event = 'VimEnter',
    config = function() require('plugins.easymotion') end,
  }
  use {
    'tpope/vim-surround',
    event = 'VimEnter',
    config = function() require('plugins.vim-surround') end,
  }
  use {
    'kdheepak/lazygit.nvim',
    event = 'VimEnter',
    config = function() require('plugins.lazygit') end,
  }
  use {
    'akinsho/toggleterm.nvim',
    event = 'VimEnter',
    config = function() require('plugins.toggleterm') end,
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VimEnter',
    config = function() require('plugins.indent-blankline') end,
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.lualine') end,
    event = 'VimEnter',
  }
  use {
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    event = 'BufWinEnter',
    config = function() require('plugins.bufferline') end,
  }
  use {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    requires = { 'kyazdani42/nvim-web-devicons', },
    config = function() require('plugins.nvim-tree') end,
  }
  use {
    'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    event = 'VimEnter',
    config = function() require('plugins.fzf-lua') end,
  }
  use {
    'CRAG666/code_runner.nvim',
    requires = 'nvim-lua/plenary.nvim',
    envet = 'VimEnter',
    config = function() require('plugins.code-runner') end,
  }
end)
