if vim.loop.os_uname().sysname == "Linux" then
  local clipboard = {}

  clipboard['name'] = 'xclip-xfce4-clipman'

  clipboard['copy'] = {}
  clipboard['copy']['+'] = 'xclip -selection clipboard'
  clipboard['copy']['*'] = 'xclip -selection clipboard'

  clipboard['paste'] = {}
  clipboard['paste']['+'] = 'xclip -selection clipboard -o'
  clipboard['paste']['*'] = 'xclip -selection clipboard -o'

  clipboard['cache_enabled'] = 1

  vim.g.clipboard = clipboard
end
