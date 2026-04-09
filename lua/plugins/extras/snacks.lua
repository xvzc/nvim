return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    styles = {
      picker = {
        border = "single",
      },
      list = {
        border = "single",
      },
      preview = {
        border = "single",
      },
      -- minimal = {
      --   border = require("shared").get_bold_square_borders(),
      -- },
      -- inputs = {
      --   border = require("shared").get_bold_square_borders(),
      -- },
    },
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    -- explorer = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    gitbrowse = { enabled = true },
    -- lazygit = { enabled = true },
    profiler = { enabled = true },
    -- words = { enabled = true },
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "cancel", mode = { "n", "i" } },
          },
        },
      },
      layouts = {
        default = {
          layout = {
            box = "horizontal",
            width = 0.8,
            min_width = 120,
            height = 0.8,
            {
              box = "vertical",
              border = "single",
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", border = "single", width = 0.5 },
          },
        },
        vertical = {
          layout = {
            box = "vertical",
            width = 0.8,
            min_width = 60,
            height = 0.9,
            {
              box = "vertical",
              border = "single",
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", border = "single" },
          },
        },
      },
      layout = {
        preset = function()
          return vim.o.columns >= 120 and "default" or "vertical"
        end,
      },
    },
    indent = {
      enabled = true,
      indent = {
        enabled = true,
        char = "┊",
      },
      scope = {
        enabled = true,
        char = "┊",
      },
      animate = {
        enabled = false,
      },
    },
    scope = {
      enabled = true,
      keys = {
        ---@type table<string, snacks.scope.TextObject|{desc?:string}|false>
        textobject = {
          ii = {
            min_size = 2, -- minimum size of the scope
            edge = false, -- inner scope
            cursor = false,
            treesitter = { blocks = { enabled = false } },
            desc = "inner scope",
          },
          ai = {
            cursor = false,
            min_size = 2, -- minimum size of the scope
            treesitter = { blocks = { enabled = false } },
            desc = "full scope",
          },
        },
        ---@type table<string, snacks.scope.Jump|{desc?:string}|false>
        jump = {
          ["]i"] = {
            min_size = 1, -- allow single line scopes
            bottom = true,
            cursor = false,
            edge = true,
            treesitter = { blocks = { enabled = false } },
            desc = "jump to bottom edge of scope",
          },
          ["[i"] = {
            min_size = 1, -- allow single line scopes
            bottom = false,
            cursor = false,
            edge = true,
            treesitter = { blocks = { enabled = false } },
            desc = "jump to top edge of scope",
          },
        },
      },
    },
  },

  init = function()
    vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#3a3d35" })
    vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#af78b3" })
    local snacks = require("snacks")

    vim.keymap.set({ "n" }, "<C-x>f", snacks.picker.smart)
    vim.keymap.set({ "n" }, "<C-x>b", snacks.picker.buffers)
    vim.keymap.set({ "n" }, "<C-x>g", snacks.picker.grep)
    -- vim.keymap.set({ "n" }, "<C-x>e", snacks.picker.explorer)
    vim.keymap.set({ "n" }, "<leader>n", snacks.notifier.show_history)
    vim.keymap.set({ "n" }, "gO", snacks.gitbrowse.open)
  end,
}
