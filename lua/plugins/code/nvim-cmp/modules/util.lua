local style = require("plugins.code.nvim-cmp.modules.style")

local M = {}

M.replace_termcodes = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.format_item = function(entry, vim_item)
  vim_item.kind = style.kind_icons[vim_item.kind]

  -- This concatonates the icons with the name of the item kind
  local MAX_LABEL_LENGTH = 30
  local label = vim.trim(vim_item.abbr)
  if string.len(label) > MAX_LABEL_LENGTH then
    label = vim.fn.strcharpart(label, 0, MAX_LABEL_LENGTH) .. ".."
  end

  vim_item.abbr = label

  return vim_item
end

M.should_enable = function()
  if require("cmp.config.context").in_treesitter_capture("comment") then
    return false
  end

  if require("cmp.config.context").in_syntax_group("Comment") then
    return false
  end

  return true
end

return M
