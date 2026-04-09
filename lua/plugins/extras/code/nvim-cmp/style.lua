local M = {}

M.kind_icons = {
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "󰙎",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰰤",
  Misc = "",
}

M.apply_style = function()
  -- gray
  vim.api.nvim_set_hl(
    0,
    "CmpItemAbbrDeprecated",
    { bg = "NONE", strikethrough = true, fg = "#808080" }
  )
  -- blue
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
  vim.api.nvim_set_hl(
    0,
    "CmpItemAbbrMatchFuzzy",
    { link = "CmpIntemAbbrMatch" }
  )
  -- light blue
  vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
  vim.api.nvim_set_hl(
    0,
    "CmpItemKindInterface",
    { link = "CmpItemKindVariable" }
  )
  vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
  -- pink
  vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
  vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
  -- front
  vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
  vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
  vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })
end

return M
