local point_color = "#FAD9D9"

local function create_navigation_func(n)
  return function()
    require("bufferline").go_to(n, true)
  end
end

local keys = {
  { mode = { "n" }, "<leader>1", create_navigation_func(1), { silent = true } },
  { mode = { "n" }, "<leader>2", create_navigation_func(2), { silent = true } },
  { mode = { "n" }, "<leader>3", create_navigation_func(3), { silent = true } },
  { mode = { "n" }, "<leader>4", create_navigation_func(4), { silent = true } },
  { mode = { "n" }, "<leader>5", create_navigation_func(5), { silent = true } },
  { mode = { "n" }, "<leader>6", create_navigation_func(6), { silent = true } },
  { mode = { "n" }, "<leader>7", create_navigation_func(7), { silent = true } },
  { mode = { "n" }, "<leader>8", create_navigation_func(8), { silent = true } },
  { mode = { "n" }, "<leader>9", create_navigation_func(9), { silent = true } },
  {
    mode = { "n" },
    "<leader>0",
    create_navigation_func(10),
    { silent = true },
  },
  { mode = { "n" }, "<leader>q", "<cmd>bd<cr>", { silent = true } },
  {
    mode = { "n" },
    "<C-Tab>",
    "<cmd>BufferLineCycleNext<CR>",
    { silent = true },
  },
  {
    mode = { "n" },
    "<C-S-Tab>",
    "<cmd>BufferLineCyclePrev<CR>",
    { silent = true },
  },
}

return {
  "akinsho/bufferline.nvim",
  -- config = config("plugins.ui.bufferline"),
  event = "VimEnter",
  keys = keys,
  opts = {
    options = {
      modified_icon = "●",
      themable = true,
      show_close_icon = false,
      show_buffer_close_icons = false,
      left_trunc_marker = "",
      right_trunc_marker = "",
      -- numbers = function(opts)
      --   return string.format("%s", opts.ordinal)
      -- end,
      numbers = "ordinal",
      -- enforce_regular_tabs = true,
      separator_style = { "", "" },
      -- "", ""
      tab_size = 15,
      -- diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
    },
    highlights = {
      indicator_selected = {
        fg = point_color,
      },
      buffer_selected = {
        fg = point_color,
        bold = true,
        italic = true,
      },
    },
  },
}
