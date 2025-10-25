-- ┌───────────────────┐
-- │ GENERAL HIGHLIGHT │
-- └───────────────────┘
local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
local cursorline = vim.api.nvim_get_hl(0, { name = "CursorLine" })

vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1a0f30" })

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffc4c4" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = normal.bg })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffc4c4" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#8c8787" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = cursorline.bg })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = cursorline.bg })
vim.api.nvim_set_hl(0, "CursorLineSign", { bg = cursorline.bg })

local cursorline_dynamic = {
  ["v"] = normal.bg,
  ["V"] = normal.bg,
  ["i"] = cursorline.bg,
  ["n"] = cursorline.bg,
}
vim.api.nvim_create_autocmd({ "ModeChanged" }, {
  callback = function()
    local cur = vim.api.nvim_get_mode()
    vim.api.nvim_set_hl(0, "CursorLine", { bg = cursorline_dynamic[cur.mode] })
    vim.api.nvim_set_hl(
      0,
      "CursorLineNr",
      { bg = cursorline_dynamic[cur.mode] }
    )
    vim.api.nvim_set_hl(
      0,
      "CursorLineSign",
      { bg = cursorline_dynamic[cur.mode] }
    )
  end,
})

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
