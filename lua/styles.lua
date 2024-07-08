-- vim.cmd([[
-- colorscheme tokyonight
--
-- hi Comment ctermfg=14 gui=italic guifg=#6b806e
--
-- command! -bang -nargs=? -complete=dir HiGroup
-- \ echo synIDattr(synID(line("."), col("."), 1), "name")
--
-- hi CursorLine guibg=#2d364f
-- hi PmenuSel blend=0
-- ]])
-- hi Cursor cterm=none gui=none guifg=#646466 ctermfg=black
-- hi Cursor guifg=#121212 guibg=#afd700

vim.cmd([[
  set winminheight=0
  hi WinSeparator guifg=#ffc4c4
  "hi Normal guibg=None
  hi Comment guifg=#8c8787
]])

local normal = vim.api.nvim_get_hl(0, { name = "Normal"})

vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffc4c4" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = normal.bg, fg = normal.fg })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = normal.bg })
vim.cmd.colorscheme "catppuccin"

vim.cmd [[
hi DiagnosticUnderlineError gui=undercurl
hi DiagnosticUnderlineWarn gui=undercurl
]]

