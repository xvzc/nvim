vim.cmd.colorscheme("catppuccin") -- This should be at the first line

-- ┌───────────────────┐ 
-- │ GENERAL HIGHLIGHT │ 
-- └───────────────────┘ 
local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffc4c4" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = normal.bg })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffc4c4" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#8c8787" })

-- ┌──────────────────────┐ 
-- │ DIAGNOSTIC HIGHLIGHT │ 
-- └──────────────────────┘ 
local diagError = vim.api.nvim_get_hl(0, { name = "DiagnosticSignError" })
local diagWarn = vim.api.nvim_get_hl(0, { name = "DiagnosticSignWarn" })
local diagHint = vim.api.nvim_get_hl(0, { name = "DiagnosticSignHint" })
local diagInfo = vim.api.nvim_get_hl(0, { name = "DiagnosticSignInfo" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
  sp = diagError.fg,
  undercurl = true,
})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
  sp = diagWarn.fg,
  undercurl = true,
})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
  sp = diagHint.fg,
  undercurl = true,
})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
  sp = diagInfo.fg,
  undercurl = true,
})
