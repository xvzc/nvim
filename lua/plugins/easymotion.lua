local test = require('util')

vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_keys = 'hklyuiopnmqwertzxcvbasdgjf'
vim.g.EasyMotion_smartcase = 1

test.nmap('<leader>f', '<Plug>(easymotion-s)', { silent = true, noremap = true })
test.nmap('<leader><leader>f', '<Plug>(easymotion-s2)', { silent = true, noremap = true })


test.autocmd('User', {
  pattern = 'EasyMotionPromptBegin',
  callback = function()
    vim.diagnostic.disable()
    vim.cmd([[Gitsigns toggle_signs]])
  end
})

test.autocmd('User', {
  pattern = 'EasyMotionPromptEnd',
  callback = function()
    local timer = vim.loop.new_timer()
    timer:start(300, 0, vim.schedule_wrap(function()
      vim.diagnostic.enable()
      vim.cmd([[Gitsigns toggle_signs]])
    end))
  end
})
