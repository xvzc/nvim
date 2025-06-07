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
  -- ┌─────┐
  -- │ LSP │
  -- └─────┘
  {
    "neovim/nvim-lspconfig",
    config = config("plugins.lsp.lspconfig"),
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = config("plugins.lsp.mason"),
        dependencies = {
          { "williamboman/mason-lspconfig.nvim" },
        },
      },
      {
        "glepnir/lspsaga.nvim",
        branch = "main",
        event = "VeryLazy",
        config = config("plugins.lsp.lspsaga"),
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
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = config("plugins.lsp.null-ls"),
  },
  -- ┌──────┐
  -- │ CODE │
  -- └──────┘
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "VeryLazy",
    config = config("plugins.code.treesitter"),
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        -- dir = "~/personal/nvim-treesitter-textobjects/",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    config = config("plugins.code.neotest"),
    dependencies = {
      "nvim-neotest/nvim-nio",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    },
  },
  {
    "CRAG666/code_runner.nvim",
    priority = 1,
    event = "BufReadPre",
    config = config("plugins.code.code-runner"),
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
  -- {
  --   "rebelot/kanagawa.nvim",
  --   priority = 1000,
  --   config = config("plugins.ui.kanagawa"),
  -- },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
    -- dir = "~/personal/neo-tree.nvim/",
    config = config("plugins.ui.neo-tree"),
  },
  {
    "karb94/neoscroll.nvim",
    config = config("plugins.ui.neoscroll"),
    event = "VeryLazy",
  },
  {
    "hedyhli/outline.nvim",
    -- 	event = "VeryLazy",
    config = config("plugins.ui.outline"),
    opts = {
      -- Your setup opts here
    },
  },
  -- {
  -- 	"simrat39/symbols-outline.nvim",
  -- 	event = "VeryLazy",
  -- 	config = config("plugins.ui.symbols-outline"),
  -- },
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
    -- dir = "~/personal/chezmoi.nvim",
    event = "BufReadPre",
    config = config("plugins.util.chezmoi"),
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
  },
  {
    "phaazon/hop.nvim",
    config = config("plugins.util.hop"),
    event = "VeryLazy",
  },
  {
    "xvzc/skeleton.nvim",
    -- dir = "~/personal/skeleton.nvim/",
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
    "yetone/avante.nvim",
    event = "VeryLazy",
    config = config("plugins.util.avante"),
    version = false, -- Never set this value to "*"! Never!
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  -- ┌──────┐
  -- │ MISC │
  -- └──────┘
  {
    "keaising/im-select.nvim",
    event = "VeryLazy",
    config = config("plugins.misc.im-select"),
  },
  {
    "farmergreg/vim-lastplace",
    config = config("plugins.misc.vim-lastplace"),
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = config("plugins.misc.colorizer"),
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    config = config("plugins.misc.todo-comments"),
  },
})
