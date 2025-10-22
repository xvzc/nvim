return {
  "yetone/avante.nvim",
  enabled = true,
  version = false, -- Never set this value to "*"! Never!
  event = "VeryLazy",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  dependencies = {
    require("plugins.code.avante.deps.render-markdown"),
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      cmd = "Copilot",
      event = "InsertEnter",
    },
  },
  opts = {
    provider = "copilot",
    providers = {
      copilot = {
        model = "claude-3.5-sonnet",
        extra_request_body = {
          temperature = 0.2,
        },
      },
    },
    windows = {
      position = "right", -- the position of the sidebar
      width = 35, -- default % based on available width
      input = {
        prefix = "❯ ",
        height = 16, -- Height of the input window in vertical layout
      },

      sidebar_header = {
        enabled = true, -- true, false to enable/disable the header
        align = "left", -- left, center, right for title
        rounded = false,
      },
      ask = {
        floating = false, -- Open the 'AvanteAsk' prompt in a floating window
        start_insert = true, -- Start insert mode when opening the ask window
        border = "rounded",
        ---@type "ours" | "theirs"
        focus_on_apply = "ours", -- which diff to focus after applying
      },
    },
  },
}
