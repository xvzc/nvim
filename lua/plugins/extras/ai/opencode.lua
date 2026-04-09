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
    {
      "Cannon07/claude-preview.nvim",
      event = "VeryLazy",
      enabled = true,
      build = function()
        local src_dir = vim.fn.stdpath("data")
          .. "/lazy/claude-preview.nvim/opencode-plugin"
        local dest_dir = vim.fn.expand("~/.config/opencode/plugins/nvim-preview")

        vim.fn.mkdir(dest_dir, "p")
        vim.fn.system(
          string.format(
            "rsync -av --delete %s/ %s/",
            vim.fn.shellescape(src_dir),
            vim.fn.shellescape(dest_dir)
          )
        )
      end,
      opts = {
        diff = {
          layout = "inline",
          labels = { current = "prev", proposed = "final" },
          auto_close = true, -- close diff after accept
          equalize = true, -- 50/50 split widths (tab/vsplit only)
          full_file = true, -- show full file, not just diff hunks (tab/vsplit only)
        },
        highlights = {
          -- inline = { -- inline layout
          --   added = { bg = "#364a36" }, -- added line background
          --   removed = { bg = "#471c1c" }, -- removed line background
          --   added_text = { bg = "#364a36" }, -- changed characters (added)
          --   removed_text = { bg = "#471c1c" }, -- changed characters (removed)
          -- },
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
          enabled = false,
          idle_delay_ms = 1000,
          edits = {
            enabled = false,
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
