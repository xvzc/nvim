vim.opt.list = true
vim.opt.listchars:append "space:⋅"

vim.opt.termguicolors = true

require("indent_blankline").setup {
  char = "",
  show_trailing_blankline_indent = false,
  -- show_end_of_line = true,
  space_char_blankline = "|",

}
