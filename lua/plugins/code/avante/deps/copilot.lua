return {
  "zbirenbaum/copilot.lua",
  enabled = true,
  opts = {
    should_attach = function(_, bufname)
      local matched_patterns  = vim.tbl_filter(function(s)
        return string.match(bufname, s)
      end, {
        ".*/.ssh/.*",
        ".*/.git/.*",
        ".*/.config/.*",
        ".*credential.*",
        ".*password.*",
        ".*token.*",
        ".*private.*",
        ".*secret.*",
        ".*envrc.*",
      })

      -- vim.notify(vim.inspect(matched_patterns))

      if #matched_patterns ~= 0 then
        return false
      end

      return true
    end,
  },
}
