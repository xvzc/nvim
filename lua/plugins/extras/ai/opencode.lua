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
    local opencode_cmd = "opencode --port"
    ---@type snacks.terminal.Opts
    local snacks_terminal_opts = {
      win = {
        position = "right",
        enter = false,
        on_win = function(win)
          -- Set up keymaps and cleanup for an arbitrary terminal
          require("opencode.terminal").setup(win.win)
        end,
      },
    }
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
      server = {
        start = function()
          require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
        end,
        stop = function()
          require("snacks.terminal").get(opencode_cmd, snacks_terminal_opts):close()
        end,
        toggle = function()
          require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
        end,
      },
    }

    local group = vim.api.nvim_create_augroup("NvimTreeOpencodeHook", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = "NvimTree",
      callback = function(ev)
        vim.keymap.set({ "n" }, "<leader>aa", function()
          if vim.bo.filetype ~= "NvimTree" then
            return
          end

          local nt_api = require("nvim-tree.api")

          local node = nt_api.tree.get_node_under_cursor()

          require("opencode").prompt(
            vim.fn.fnamemodify(node.absolute_path, ":~") .. "\n",
            {}
          )
        end, { silent = true, noremap = true, buffer = ev.buf })
      end,
    })

    -- Recommended/example keymaps
    vim.keymap.set({ "n" }, "<leader>aa", function()
      require("opencode").prompt("@buffer\n", {})
    end, { desc = "Add the buffer to context" })

    vim.keymap.set({ "x" }, "<leader>aa", function()
      require("opencode").prompt("@this\n", {})
    end, { desc = "Add the selection to context" })

    vim.keymap.set({ "n" }, "<leader>ad", function()
      require("opencode").prompt("@diff: ", { submit = false })
    end, { desc = "Ask about diff" })

    vim.keymap.set({ "n" }, "<leader>ai", function()
      require("opencode").prompt("@diagnostic: ", { submit = false })
    end, { desc = "Ask about diagnostic" })

    vim.keymap.set({ "n", "x" }, "<leader>ax", function()
      require("opencode").select()
    end, { desc = "Execute opencode action" })
  end,
}
