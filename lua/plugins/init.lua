local packer = nil

local function init()
  if packer == nil then
    packer = require 'packer'
    packer.init {
      profile = {
        enable = true,
      },
      disable_commands = true,
      display = {
        open_fn = function()
          local result, win, buf = require('packer.util').float {
            border = {
              { '╭', 'FloatBorder' },
              { '─', 'FloatBorder' },
              { '╮', 'FloatBorder' },
              { '│', 'FloatBorder' },
              { '╯', 'FloatBorder' },
              { '─', 'FloatBorder' },
              { '╰', 'FloatBorder' },
              { '│', 'FloatBorder' },
            },
          }
          vim.api.nvim_win_set_option(win, 'winhighlight', 'NormalFloat:Normal')
          return result, win, buf
        end,
      },
    }
  end

  local use = packer.use
  packer.reset()

  -- eager load
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use "nvim-lua/plenary.nvim"
  use 'folke/tokyonight.nvim'
  use 'morhetz/gruvbox'

  use {
    'farmergreg/vim-lastplace',
    config = "require('plugins.vim-lastplace')",
    event = "BufWinEnter",
  }
  use {
    'glepnir/dashboard-nvim',
    config = "require('plugins.dashboard-nvim')",
    event = "BufWinEnter"
  }
  use {
    'neovim/nvim-lspconfig',
    config = "require('plugins.nvim-lspconfig')",
    event = 'BufWinEnter',
    requires = { 'nvim-lspconfig' }
  }

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = "require('plugins.lspsaga')"
  })


  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = "require('plugins.null-ls')",
  }

  use {
    'williamboman/mason.nvim',
    config = "require('plugins.mason')",
    event = "VimEnter"
  }

  use {
    'SirVer/ultisnips',
    config = "require('plugins.ultisnips')",
    event = 'VimEnter',
  }

  use {
    'keaising/im-select.nvim',
    config = function()
      require('im_select').setup {
        default_im_select    = "com.apple.keylayout.ABC",
        disable_auto_restore = 0,
      }
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    config = [[require('plugins.nvim-cmp')]],
    event = 'VimEnter',
    requires = {
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      'lukas-reineke/cmp-under-comparator',
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' },
      {
        'quangnguyen30192/cmp-nvim-ultisnips',
        after = 'nvim-cmp',
        config = function() require("cmp_nvim_ultisnips").setup {} end,
      },
    },
  }

  -- plugins that are dependant on web-devicons
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require('plugins.lualine')",
    event = 'VimEnter',
  }
  use {
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require('plugins.bufferline')",
    event = 'BufWinEnter',
  }
  use {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    requires = { 'kyazdani42/nvim-web-devicons', },
    config = "require('plugins.nvim-tree')",
    keys = "<leader>e",
    opt = true
  }

  -- language supports
  use { 'fatih/vim-go', ft = { 'go' } }
  use { 'yuezk/vim-js', ft = { 'js' } }
  use { 'othree/yajs.vim', ft = { 'js' } }
  use { 'HerringtonDarkholme/yats.vim', ft = { 'js' } }
  use { 'maxmellon/vim-jsx-pretty', ft = { 'jsx' } }
  use { 'iamcco/markdown-preview.nvim', ft = { 'md' }, }
  use { 'hashivim/vim-terraform', ft = { 'tf', 'terraform' }, }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = "require('plugins.treesitter')",
    branch = "v0.8.0",
    event = 'VimEnter',
  }

  use {
    'junegunn/fzf',
    requires = { 'junegunn/fzf.vim' },
    run = './install --bin',
    config = "require('plugins.fzf')",
    event = 'VimEnter',
  }
  use {
    'numToStr/Comment.nvim',
    config = "require('plugins.comment')",
    event = 'VimEnter'
  }

  use { 'tpope/vim-fugitive', event = 'VimEnter', }
  use { 'godlygeek/tabular', event = 'VimEnter', }
  use {
    'lewis6991/gitsigns.nvim',
    config = "require('plugins.gitsigns')",
    event = 'VimEnter',
  }
  use {
    'easymotion/vim-easymotion',
    config = "require('plugins.easymotion')",
    event = 'VimEnter',
  }
  use {
    'tpope/vim-surround',
    config = "require('plugins.vim-surround')",
    event = 'VimEnter',
  }
  use {
    'windwp/nvim-autopairs',
    config = "require('plugins.nvim-autopairs')",
    event = 'VimEnter',
  }
  use {
    'kdheepak/lazygit.nvim',
    config = "require('plugins.lazygit')",
    event = 'VimEnter',
  }
  use {
    'akinsho/toggleterm.nvim',
    config = "require('plugins.toggleterm')",
    event = 'VimEnter',
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = "require('plugins.indent-blankline')",
    event = 'VimEnter',
  }
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

local create_cmd = vim.api.nvim_create_user_command
create_cmd('PackerInstall', function()
  vim.cmd([[packadd packer.nvim]])
  plugins.install()
end, {})
create_cmd('PackerUpdate', function()
  vim.cmd([[packadd packer.nvim]])
  plugins.update()
end, {})
create_cmd('PackerSync', function()
  vim.cmd([[packadd packer.nvim]])
  plugins.sync()
end, {})
create_cmd('PackerClean', function()
  vim.cmd([[packadd packer.nvim]])
  plugins.clean()
end, {})
create_cmd('PackerCompile', function()
  vim.cmd([[packadd packer.nvim]])
  plugins.compile()
end, {})

return plugins
