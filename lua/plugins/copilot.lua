local global = require('global')
local copilot = require("copilot")
local copilot_suggestion = require('copilot.suggestion')

copilot.setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
  }
})

local silent_noremap = { silent = true, noremap = true }

global.imap('<Tab>', function()
  if copilot_suggestion.is_visible() then
    copilot_suggestion.accept()
    return
  end

  vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n')
end, silent_noremap)

global.imap('<C-j>', function()
  if copilot_suggestion.is_visible() then
    copilot_suggestion.next()
  else
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-j>', true, true, true), 'n')
  end
end, silent_noremap)

global.imap('<C-k>', function()
  if copilot_suggestion.is_visible() then
    copilot_suggestion.prev()
  else
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-k>', true, true, true), 'n')
  end
end, silent_noremap)

global.imap('<C-\\>', function()
  if copilot_suggestion.is_visible() then
    copilot_suggestion.dismiss()
  else
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-\\>', true, true, true), 'n')
  end
end, silent_noremap)
