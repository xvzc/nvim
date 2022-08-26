local packer = require('packer')
packer.reset()

return packer.startup(function(use)
  -- eager load
  use 'wbthomason/packer.nvim'
  use'folke/tokyonight.nvim'
  use {
    'farmergreg/vim-lastplace',
    event = 'BufReadPost',
    config = "require('settings.vim-lastplace')"
  }
  use {
    'glepnir/dashboard-nvim',
    event = "VimEnter",
    config = [[require('settings.dashboard-nvim')]]
  }

  use {
    {
      'neovim/nvim-lspconfig',
      config = "require('settings.nvim-lspconfig')",
      before = 'nvim-cmp'
    },
    {
      'hrsh7th/nvim-cmp',
      config = "require('settings.nvim-cmp')",
    },
    {
      'hrsh7th/cmp-nvim-lsp',
      requires = { 'nvim-cmp' }
    },
    {
      'hrsh7th/cmp-buffer',
      requires = { 'nvim-cmp' }
    },
    {
      'hrsh7th/cmp-cmdline',
      requires = { 'nvim-cmp' }
    },
    {
      'hrsh7th/cmp-path',
      requires = { 'nvim-cmp' }
    },
    {
      'quangnguyen30192/cmp-nvim-ultisnips',
      config = function() require("cmp_nvim_ultisnips").setup{} end
    },
    {
      'SirVer/ultisnips',
      before = 'nvim-cmp',
      config = "require('settings.ultisnips')"
    },
    {
      'williamboman/mason.nvim',
      before = 'nvim-lspconfig',
      config = "require('settings.mason')",
    },

    event = 'BufWinenter'
  }

  -- syntax
  use {
    { 'yuezk/vim-js', ft = { 'js' } },
    { 'othree/yajs.vim', ft = { 'js' } },
    { 'HerringtonDarkholme/yats.vim', ft = { 'js' } },
    { 'maxmellon/vim-jsx-pretty', ft = { 'jsx' } },
    { 'iamcco/markdown-preview.nvim', ft = { 'md' }, },
  }

  use {
    {
      'junegunn/fzf',
      requires = { 'junegunn/fzf.vim' },
      run = './install --bin',
      config = "require('settings.fzf')"
    },
    { 'tpope/vim-fugitive', },
    {
      'airblade/vim-gitgutter',
      config = "require('settings.vim-gitgutter')"
    },
    {
      'easymotion/vim-easymotion',
      config = "require('settings.easymotion')"
    },
    {
      'tpope/vim-surround',
      config = "require('settings.vim-surround')"
    },
    {
      'windwp/nvim-autopairs',
      config = "require('settings.nvim-autopairs')"
    },
    { 'godlygeek/tabular' },
    { 'tpope/vim-commentary' },
    {
      'kdheepak/lazygit.nvim',
      config = "require('settings.lualine')"
    },
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = "require('settings.treesitter')"
    },
    {
      'akinsho/toggleterm.nvim',
      config = "require('settings.toggleterm')"
    },
    {
      'lukas-reineke/indent-blankline.nvim',
      config = "require('settings.indent-blankline')"
    },
    event = 'BufWinEnter',
  }

  -- plugins that are dependant on web-devicons
  use {
    {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = "require('settings.lualine')"
    },
    {
      'akinsho/bufferline.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      tag = 'v2.*',
      config = "require('settings.bufferline')"
    },
    {
      'kyazdani42/nvim-tree.lua',
      tag = 'nightly', -- optional, updated every week. (see issue #1193)

      requires = { 'kyazdani42/nvim-web-devicons', },
      config = "require('settings.nvim-tree')"
    },

  }

end)
