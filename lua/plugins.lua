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
    config = "require('settings.dashboard-nvim')"
  }
  use {
    'williamboman/mason.nvim',
    config = "require('settings.mason')",
  }

  use {
    'keaising/im-select.nvim',
    config = function()
      require('im_select').setup {
        default_im_select  = "com.apple.keylayout.ABC",
        disable_auto_restore = 0,
      }
    end
  }

  use {
    {
      'neovim/nvim-lspconfig',
      config = "require('settings.nvim-lspconfig')",
      event = 'VimEnter',
    },
    {
      'hrsh7th/nvim-cmp',
      after = { 'nvim-lspconfig' },
      config = "require('settings.nvim-cmp')",
      event = 'VimEnter',
    },
    {
      'SirVer/ultisnips',
      config = "require('settings.ultisnips')",
      event = 'VimEnter'
    },
    {
      'hrsh7th/cmp-nvim-lsp',
      event = 'UIEnter',
    },
    {
      'hrsh7th/cmp-cmdline',
      event = 'UIEnter',
    },
    {
      'hrsh7th/cmp-path',
      event = 'UIEnter',
    },
    {
      'hrsh7th/cmp-buffer',
      event = 'UIEnter',
    },
    {
      'quangnguyen30192/cmp-nvim-ultisnips',
      config = function() require("cmp_nvim_ultisnips").setup{} end,
      event = 'UIEnter'
    },
  }

  -- syntax
  use {
    { 'yuezk/vim-js', ft = { 'js' } },
    { 'othree/yajs.vim', ft = { 'js' } },
    { 'HerringtonDarkholme/yats.vim', ft = { 'js' } },
    { 'maxmellon/vim-jsx-pretty', ft = { 'jsx' } },
    { 'iamcco/markdown-preview.nvim', ft = { 'md' }, },
    { 'hashivim/vim-terraform', ft = { 'tf', 'terraform' }, },
  }

  use {
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = "require('settings.treesitter')",
      event = 'UIEnter',
    },
    {
      'junegunn/fzf',
      requires = { 'junegunn/fzf.vim' },
      run = './install --bin',
      config = "require('settings.fzf')",
      event = 'UIEnter',
    },
    {
      'tpope/vim-fugitive',
      event = 'UIEnter',
    },
    {
      'airblade/vim-gitgutter',
      config = "require('settings.vim-gitgutter')",
      event = 'UIEnter',
    },
    {
      'easymotion/vim-easymotion',
      config = "require('settings.easymotion')",
      event = 'UIEnter',
    },
    {
      'tpope/vim-surround',
      config = "require('settings.vim-surround')",
      event = 'UIEnter',
    },
    {
      'windwp/nvim-autopairs',
      config = "require('settings.nvim-autopairs')",
      event = 'UIEnter',
    },
    { 
      'godlygeek/tabular' ,
      event = 'UIEnter',
    },
    { 
      'tpope/vim-commentary',
      event = 'UIEnter',
    },
    {
      'kdheepak/lazygit.nvim',
      config = "require('settings.lazygit')",
      event = 'UIEnter',
    },
    {
      'akinsho/toggleterm.nvim',
      config = "require('settings.toggleterm')",
      event = 'UIEnter',
    },
    {
      'lukas-reineke/indent-blankline.nvim',
      config = "require('settings.indent-blankline')",
      event = 'UIEnter',
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
