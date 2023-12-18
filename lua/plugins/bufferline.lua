require('bufferline').setup {
  options = {
    modified_icon = "●",
    show_close_icon = true,
    show_buffer_close_icons = false,
    left_trunc_marker = "",
    right_trunc_marker = "",
    tab_size = 20,
    diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
  },
  highlights = {
    indicator_selected = {
      fg = '#FFFFFF',
    },
  }
}

vim.keymap.set('n',
  '<leader>1',
  '<cmd>lua require("bufferline").go_to_buffer(1, true)<cr>',
  { silent = true }
)

vim.keymap.set('n',
  '<leader>2',
  '<cmd>lua require("bufferline").go_to_buffer(2, true)<cr>',
  { silent = true }
)

vim.keymap.set('n',
  '<leader>3',
  '<cmd>lua require("bufferline").go_to_buffer(3, true)<cr>',
  { silent = true }
)

vim.keymap.set('n',
  '<leader>4',
  '<cmd>lua require("bufferline").go_to_buffer(4, true)<cr>',
  { silent = true }
)

vim.keymap.set('n',
  '<leader>5',
  '<cmd>lua require("bufferline").go_to_buffer(5, true)<cr>',
  { silent = true }
)

vim.keymap.set('n',
  '<leader>6',
  '<cmd>lua require("bufferline").go_to_buffer(6, true)<cr>',
  { silent = true }
)

vim.keymap.set('n',
  '<leader>7',
  '<cmd>lua require("bufferline").go_to_buffer(7, true)<cr>',
  { silent = true }
)

vim.keymap.set('n',
  '<leader>8',
  '<cmd>lua require("bufferline").go_to_buffer(8, true)<cr>',
  { silent = true }
)

vim.keymap.set('n',
  '<leader>9',
  '<cmd>lua require("bufferline").go_to_buffer(9, true)<cr>',
  { silent = true }
)

vim.keymap.set('n',
  '<leader>0',
  '<cmd>lua require("bufferline").go_to_buffer(10, true)<cr>',
  { silent = true }
)

vim.keymap.set('n',
  '<leader>$',
  '<cmd>lua require("bufferline").go_to_buffer(-1, true)<cr>',
  { silent = true }
)

vim.keymap.set('n',
  '<leader>^',
  '<cmd>lua require("bufferline").go_to_buffer(1, true)<cr>',
  { silent = true }
)

vim.keymap.set('n',
  '<leader>q',
  '<cmd>bd<cr>',
  { silent = true }
)

vim.keymap.set('n',
  ']b',
  ':BufferLineCycleNext<CR>',
  { silent = true }
)

vim.keymap.set('n',
  '[b',
  ':BufferLineCyclePrev<CR>',
  { silent = true }
)

