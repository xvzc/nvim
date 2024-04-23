local fs = require("neo-tree.sources.filesystem")

require("neo-tree").setup({
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
  commands = {
    sync_root = function(state)
      if state.search_pattern then
        fs.reset_search(state, false)
      end

      local node = state.tree:get_node()
      local id = node.type == "directory" and node.id or node._parent_id
      fs._navigate_internal(state, id, nil, nil, false)
    end,
  },

  window = {
    width = 40,
  },

  filesystem = {
    bind_to_cwd = true,
    group_empty_dirs = false,
    filtered_items = {
      hide_by_name = {
        "node_modules",
      },
      never_show = {
        ".DS_Store",
      },
    },
    window = {
      mappings = {
        ["p"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        ["h"] = "navigate_up",
        ["l"] = "sync_root",
        ["o"] = { "open", nowait = true },

        -- -- disabled
        ["P"] = "noop", -- toggle_preview
        ["oc"] = "noop", -- order_by_created
        ["od"] = "noop", -- order_by_diagnostics
        ["om"] = "noop", -- order_by_modified
        ["og"] = "noop", -- order_by_git_status
        ["on"] = "noop", -- order_by_name
        ["os"] = "noop", -- order_by_size
        ["ot"] = "noop", -- order_by_type
      },
    },
  },
})

vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({
    toggle = true,
  })
end, { silent = true })
