local function config()
  local oil = require("oil")
  vim.keymap.set("n", "<F2>", oil.toggle_float)
  oil.setup({
    use_default_keymaps = false,
    show_hidden = false,
    win_options = {
      number = false,
      relativenumber = false,
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
      -- Padding around the floating window
      padding = 10,
      -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      max_width = 0.8,
      max_height = 0.95,
      border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
      win_options = {
        winblend = 10,
      },
      -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
      get_win_title = nil,
      -- preview_split: Split direction: "auto", "left", "right", "above", "below".
      preview_split = "right",
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      override = function(conf)
        return conf
      end,
    },
  })
end

return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  -- Optional dependencies
  -- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  config = config,
  lazy = false,
}
