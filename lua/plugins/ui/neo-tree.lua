local keys = {
  {
    mode = { "n" },
    "<leader>e",
    function()
      require("neo-tree.command").execute({ toggle = true, reveal = true })
    end,
    silent = true,
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  event = "VeryLazy",
  keys = keys,
  opts = {
    use_default_mappings = false,
    close_if_last_window = true,
    enable_diagnostics = false,
    sort_function = nil,
    default_component_configs = {
      modified = {
        symbol = "",
        highlight = "NeoTreeModified",
      },
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          unstaged = "*",
        },
      },
      follow_current_file = {
        enabled = true,
      },
    },

    window = {
      width = 40,
    },

    filesystem = {
      bind_to_cwd = true,
      group_empty_dirs = false,
      filtered_items = {
        children_inherit_highlights = false,
        hide_by_name = {
          "node_modules",
        },
        never_show = {
          ".DS_Store",
        },
      },
      window = {
        mappings = {
          ["a"] = { "open", nowait = true },
          -- ["l"] = { "open", nowait = true },
          ["<CR>"] = { "open", nowait = true },
          ["<BS>"] = "navigate_up",
          ["u"] = "navigate_up",
          -- ["h"] = "navigate_up",

          ["-"] = "open_split",
          ["_"] = "open_vsplit",

          ["r"] = "refresh",

          ["H"] = "toggle_hidden",
          ["q"] = "close_window",
          ["."] = "set_root",
          ["p"] = {
            "toggle_preview",
            config = { use_float = false, use_image_nvim = true },
          },
        },
      },
    },
  },
}
