local shared = require("shared")

local group = vim.api.nvim_create_augroup("NvimTreeCustomHook", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "NvimTree",
  callback = function(ev)
    vim.keymap.set({ "n" }, "o", function()
      if vim.bo.filetype ~= "NvimTree" then
        return
      end

      local oil = require("oil")
      local nt_api = require("nvim-tree.api")
      local node = nt_api.tree.get_node_under_cursor()
      nt_api.tree.close()

      local cur_dir = vim.fn.fnamemodify(node.absolute_path, ":h")
      oil.open_float(cur_dir)

      -- if node.type == "file" then
      --   local dir = vim.fn.fnamemodify(node.absolute_path, ":h")
      --   oil.open_float(dir)
      -- else
      --   oil.open_float(node.absolute_path)
      -- end
    end, { silent = true, noremap = true, buffer = ev.buf })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "oil",
  callback = function(ev)
    -- vim.keymap.set("n", "a", api.node.open.edit, opts("open_or_edit"))
    -- vim.keymap.set("n", "a", api.node.open.edit, opts("open_or_edit"))
    vim.keymap.set({ "n" }, "q", function()
      local oil = require("oil")
      -- local dir = oil.get_current_dir(ev.buf)
      oil.close()
      require("nvim-tree.api").tree.open()
    end, { nowait = true, silent = true, noremap = true, buffer = ev.buf })
  end,
})

return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  enabled = true,
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    use_default_keymaps = false,
    show_hidden = false,
    win_options = {
      number = true,
      relativenumber = true,
    },
    keymaps = {
      ["<CR>"] = "actions.select",
      ["<F5>"] = "actions.refresh",
      ["<BS>"] = { "actions.parent", mode = "n" },
      ["q"] = { "actions.close", mode = "n", nowait = true },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    float = {
      padding = 2,
      border = shared.double_square_borders(),
      win_options = {
        winblend = 0,
      },
      get_win_title = function()
        return "Editing with oil.nvim"
      end,
      override = function(conf)
        local info = shared.get_dynamic_float_size(0.7, 0.8, 70, 35)
        conf.width = info.width
        conf.height = info.height
        conf.row = info.row
        conf.col = info.col

        -- conf.padding = 10
        return conf
      end,
    },
    view_options = {
      show_hidden = true,
      is_hidden_file = function(name, bufnr)
        local m = name:match("^%.")
        return m ~= nil
      end,
      is_always_hidden = function(name, bufnr)
        return false
      end,
      natural_order = "fast",
      case_insensitive = false,
      sort = {
        { "type", "asc" },
        { "name", "asc" },
      },
      highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
        return nil
      end,
    },
    confirmation = {
      border = shared.double_square_borders(),
      win_options = {
        winblend = 0,
      },
    },
  },
}
