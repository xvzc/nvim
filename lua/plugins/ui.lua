return {
  {
    {
      "norcalli/nvim-colorizer.lua",
      opts = {
        "*",
      },
    },
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        virt_text_priority = 10000,
        delay = 500,
        ignore_whitespace = true,
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    enabled = true,
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    event = "VeryLazy",
    keys = {
      { mode = { "n" }, "<leader>gg", ":LazyGit<CR>", { silent = true } },
    },
    init = function()
      -- transparency of floating window
      vim.g.lazygit_floating_window_winblend = 0

      -- scaling factor for floating window
      vim.g.lazygit_floating_window_scaling_factor = 0.75

      -- customize lazygit popup window corner characters
      vim.g.lazygit_floating_window_border_chars =
        require("shared").double_square_borders()

      -- use plenary.nvim to manage floating window if available
      vim.g.lazygit_floating_window_use_plenary = 0

      -- fallback to 0 if neovim-remote is not installed
      vim.g.lazygit_use_neovim_remote = 1

      -- setup mapping to call :LazyGit
    end,
  },
  {
    "lewis6991/satellite.nvim",
    opts = {
      handlers = {
        cursor = {
          enable = false,
        },
        gitsigns = {
          enable = true,
          signs = { -- can only be a single character (multibyte is okay)
            add = "-",
            change = "-",
            delete = "-",
          },
        },
      },
    },
  },
  {
    "karb94/neoscroll.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {
      -- All these keys will be mapped to their corresponding default scrolling animation
      mappings = {
        "<C-u>",
        "<C-d>",
        "<C-b>",
        "<C-f>",
        "<C-y>",
        "<C-e>",
        "zt",
        "zz",
        "zb",
      },
      hide_cursor = true, -- Hide cursor while scrolling
      stop_eof = true, -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing_function = nil, -- Default easing function
      pre_hook = nil, -- Function to run before the scrolling animation starts
      post_hook = nil, -- Function to run after the scrolling animation ends
      performance_mode = false, -- Disable "Performance Mode" on all buffers.
    },
  },
  -- { "nvim-mini/mini.pick", version = "*" },
  {
    "nvim-mini/mini.files",
    version = "*",
    opts = {
      mappings = {
        close = "q",
        go_in = "l",
        go_in_plus = "<CR>",
        go_out = "h",
        go_out_plus = "<BS>",
        mark_goto = "'",
        mark_set = "m",
        reset = "<F5>",
        -- reveal_cwd = "R",
        show_help = "g?",
        synchronize = "=",
        trim_left = "<",
        trim_right = ">",
      },
    },
    init = function()
      vim.keymap.set("n", "<leader>e", function()
        local mini_files = require("mini.files")
        if not mini_files.close() then
          mini_files.open()
        end
      end, { silent = true, noremap = true })
    end,
  },
}
