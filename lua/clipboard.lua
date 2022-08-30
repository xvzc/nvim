local global = require('global')

if global.osid == 'mac' then
  vim.cmd("lang en_US")
end

if global.osid == 'linux-arch' then
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
