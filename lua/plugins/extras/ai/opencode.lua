---@type snacks.terminal.Opts
local snacks_terminal_opts = {
  win = {
    position = "float",
    enter = true,
    on_win = function(win)
      -- Set up keymaps and cleanup for an arbitrary terminal
      require("opencode.terminal").setup(win.win)
    end,
  },
}

return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      "folke/snacks.nvim",
      optional = false,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...)
              return require("plugins.dev.opencode.init").snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                -- ["<C-y>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    vim.g.opencode_opts = {
      events = {
        enabled = true,
        reload = true,
        permissions = {
          enabled = true,
          idle_delay_ms = 1000,
          edits = {
            enabled = true,
          },
        },
      },
    }

    -- Recommended/example keymaps
    vim.keymap.set({ "n" }, "<leader>aa", function()
      require("opencode").prompt("<ref type='file(abs)' at='@buffer'>\n", {})
    end, { desc = "Add the buffer to context" })

    vim.keymap.set({ "x" }, "<leader>aa", function()
      require("opencode").prompt("<ref type='file(abs)' at='@this'>\n", {})
    end, { desc = "Add the selection to context" })

    vim.keymap.set({ "n" }, "<leader>ad", function()
      require("opencode").prompt("@diff: ", { submit = true })
    end, { desc = "Ask about diff" })

    vim.keymap.set({ "n" }, "<leader>ai", function()
      require("opencode").prompt("@diagnostic: ", { submit = true })
    end, { desc = "Ask about diagnostic" })

    vim.keymap.set({ "n", "x" }, "<leader>ax", function()
      require("opencode").select()
    end, { desc = "Execute opencode action" })
  end,
}
