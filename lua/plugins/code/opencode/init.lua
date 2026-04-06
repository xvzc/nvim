local opencode_cmd = "opencode --port"
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
              return require("opencode").snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                ["<C-y>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    vim.o.autoread = true -- Required for `opts.events.reload`

    -- Recommended/example keymaps
    vim.keymap.set({ "n" }, "<leader>aa", function()
      require("opencode").prompt("<ref type='file' at='@buffer'>\n", {})
    end, { desc = "Ask opencode…" })

    vim.keymap.set({ "x" }, "<leader>aa", function()
      require("opencode").prompt("<ref type='file' at='@this'>\n", {})
    end, { desc = "Ask opencode…" })

    vim.keymap.set({ "n" }, "<leader>ad", function()
      require("opencode").prompt("@diff: ", { submit = true })
    end, { desc = "Ask opencode…" })

    vim.keymap.set({ "n" }, "<leader>ai", function()
      require("opencode").prompt("@diagnostic: ", { submit = true })
    end, { desc = "Ask opencode…" })

    vim.keymap.set({ "n", "x" }, "<leader>ax", function()
      require("opencode").select()
    end, { desc = "Execute opencode action…" })
  end,
}
