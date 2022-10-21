-- local ensure_packer = function()
--   local fn = vim.fn
--   local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--   if fn.empty(fn.glob(install_path)) > 0 then
--     fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--     vim.cmd [[packadd packer.nvim]]
--     return true
--   end
--   return false
-- end

-- local packer_bootstrap = ensure_packer()
--
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
  use {
    'tpope/vim-commentary',
    event = 'VimEnter',
  }

  use 'folke/tokyonight.nvim'

  use {
    'farmergreg/vim-lastplace',
    config = "require('settings.vim-lastplace')",
    event = "BufWinEnter",
  }
  use {
    'glepnir/dashboard-nvim',
    config = "require('settings.dashboard-nvim')",
    event = "BufWinEnter"
  }
  use {
    'neovim/nvim-lspconfig',
    config = "require('settings.nvim-lspconfig')",
    event = 'BufWinEnter',
  }

  use {
    'williamboman/mason.nvim',
    config = "require('settings.mason')",
    event = "VimEnter"
  }

  use {
    'SirVer/ultisnips',
    config = "require('settings.ultisnips')",
    event = 'VimEnter',
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
    'hrsh7th/nvim-cmp',
    config = [[require('settings.nvim-cmp')]],
    event = 'InsertEnter',
    requires = {
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'},
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
        config = function() require("cmp_nvim_ultisnips").setup{} end,
      },
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
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = "require('settings.treesitter')",
      event = 'VimEnter',
    }

    use {
      'junegunn/fzf',
      requires = { 'junegunn/fzf.vim' },
      run = './install --bin',
      config = "require('settings.fzf')",
      event = 'VimEnter',
    }

    use {
      'tpope/vim-fugitive',
      event = 'VimEnter',
    }
    use {
      'godlygeek/tabular' ,
      event = 'VimEnter',
    }
    use {
      'easymotion/vim-easymotion',
      config = "require('settings.easymotion')",
      event = 'VimEnter',
    }
    use {
      'tpope/vim-surround',
      config = "require('settings.vim-surround')",
      event = 'VimEnter',
    }
    use {
      'windwp/nvim-autopairs',
      config = "require('settings.nvim-autopairs')",
      event = 'VimEnter',
    }
    use {
      'kdheepak/lazygit.nvim',
      config = "require('settings.lazygit')",
      event = 'VimEnter',
    }
    use {
      'akinsho/toggleterm.nvim',
      config = "require('settings.toggleterm')",
      event = 'VimEnter',
    }
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = "require('settings.indent-blankline')",
      event = 'VimEnter',
    }

  -- plugins that are dependant on web-devicons
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = "require('settings.lualine')",
      event = 'InsertEnter',
    }
    use {
      'akinsho/bufferline.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = "require('settings.bufferline')",
      event = 'BufWinEnter',
    }
    use {
      'kyazdani42/nvim-tree.lua',
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      requires = { 'kyazdani42/nvim-web-devicons', },
      config = "require('settings.nvim-tree')",
      keys = "<leader>e",
      opt = true
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
