local bufferline = require("bufferline")

local point_color = "#FAD9D9"
require("bufferline").setup({
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
})

vim.keymap.set("n", "<leader>1", function()
  bufferline.go_to(1, true)
end, { silent = true })

vim.keymap.set("n", "<leader>2", function()
  bufferline.go_to(2, true)
end, { silent = true })

vim.keymap.set("n", "<leader>3", function()
  bufferline.go_to(3, true)
end, { silent = true })

vim.keymap.set("n", "<leader>4", function()
  bufferline.go_to(4, true)
end, { silent = true })

vim.keymap.set("n", "<leader>5", function()
  bufferline.go_to(5, true)
end, { silent = true })

vim.keymap.set("n", "<leader>6", function()
  bufferline.go_to(6, true)
end, { silent = true })

vim.keymap.set("n", "<leader>7", function()
  bufferline.go_to(7, true)
end, { silent = true })

vim.keymap.set("n", "<leader>8", function()
  bufferline.go_to(8, true)
end, { silent = true })

vim.keymap.set("n", "<leader>9", function()
  bufferline.go_to(9, true)
end, { silent = true })

vim.keymap.set("n", "<leader>0", function()
  bufferline.go_to(10, true)
end, { silent = true })

vim.keymap.set("n", "<leader>$", function()
  bufferline.go_to(-1, true)
end, { silent = true })

vim.keymap.set("n", "<leader>^", function()
  bufferline.go_to(1, true)
end, { silent = true })

vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", { silent = true })

vim.keymap.set("n", "<C-Tab>", "<cmd>BufferLineCycleNext<CR>", { silent = true })

vim.keymap.set("n", "<C-S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
