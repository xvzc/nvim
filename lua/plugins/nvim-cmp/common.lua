local common = {}

common.replace_termcodes= function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end


return common
