local packer = require('packer')
packer.reset()

return packer.startup(function(use)
  -- eager load
  use 'wbthomason/packer.nvim'

  use 'folke/tokyonight.nvim'
  use {
    'farmergreg/vim-lastplace',
    event = 'BufReadPost',
    config = "require('settings.vim-lastplace')"
  }
  use {
    'glepnir/dashboard-nvim',
    event = "VimEnter",
    config = "require('settings.dashboard-nvim')"
  }
  use {
    'williamboman/mason.nvim',
    config = "require('settings.mason')",
  }

  use {
    {
      'neovim/nvim-lspconfig',
      config = "require('settings.nvim-lspconfig')",
      event = 'BufWinEnter',
    },
    use {
      'hrsh7th/nvim-cmp',
      after = { 'nvim-lspconfig' },
      config = "require('settings.nvim-cmp')",
      event = 'BufWinEnter',
    },
    {
      'hrsh7th/cmp-nvim-lsp',
      after = { 'nvim-cmp' },
      event = 'BufWinEnter',
    },
    {
      'hrsh7th/cmp-cmdline',
      after = { 'nvim-cmp' },
      event = 'BufWinEnter',
    },
    {
      'hrsh7th/cmp-path',
      after = { 'nvim-cmp' },
      event = 'BufWinEnter',
    },
    {
      'hrsh7th/cmp-buffer',
      after = { 'nvim-cmp' },
      event = 'BufWinEnter',
    },
    {
      'SirVer/ultisnips',
      before = { 'cmp-nvim-ultisnips' },
      config = "require('settings.ultisnips')",
      event = 'BufWinEnter'
    },
    {
      'quangnguyen30192/cmp-nvim-ultisnips',
      after = { 'nvim-cmp' },
      config = function() require("cmp_nvim_ultisnips").setup{} end,
      event = 'BufWinEnter'
    },
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
      config = "require('settings.fzf')",
      event = 'BufWinEnter',
    },
    {
      'tpope/vim-fugitive',
      event = 'BufWinEnter',
    },
    {
      'airblade/vim-gitgutter',
      config = "require('settings.vim-gitgutter')",
      event = 'BufWinEnter',
    },
    {
      'easymotion/vim-easymotion',
      config = "require('settings.easymotion')",
      event = 'BufWinEnter',
    },
    {
      'tpope/vim-surround',
      config = "require('settings.vim-surround')",
      event = 'BufWinEnter',
    },
    {
      'windwp/nvim-autopairs',
      config = "require('settings.nvim-autopairs')",
      event = 'BufWinEnter',
    },
    { 
      'godlygeek/tabular' ,
      event = 'BufWinEnter',
    },
    { 
      'tpope/vim-commentary',
      event = 'BufWinEnter',
    },
    {
      'kdheepak/lazygit.nvim',
      config = "require('settings.lualine')",
      event = 'BufWinEnter',
    },
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = "require('settings.treesitter')",
      event = 'BufWinEnter',
    },
    {
      'akinsho/toggleterm.nvim',
      config = "require('settings.toggleterm')",
      event = 'BufWinEnter',
    },
    {
      'lukas-reineke/indent-blankline.nvim',
      config = "require('settings.indent-blankline')",
      event = 'BufWinEnter',
    },
    {
      'hashivim/vim-terraform',
      event = 'BufWinEnter',
    },
  }

  -- plugins that are dependant on web-devicons
  use {
    {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = "require('settings.lualine')",
    },
    {
      'akinsho/bufferline.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      tag = 'v2.*',
      config = "require('settings.bufferline')",
    },
    {
      'kyazdani42/nvim-tree.lua',
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      requires = { 'kyazdani42/nvim-web-devicons', },
      config = "require('settings.nvim-tree')",
    },
  }

end)
