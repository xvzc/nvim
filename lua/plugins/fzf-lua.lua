local fzf_lua = require('fzf-lua')
local util = require('util')
local profile = require('profile')

fzf_lua.setup {
  winopts = {
    preview = { default = 'bat_native' },
    height = 0.6,
    width = 0.6,
  }
}

local buf_opt = { noremap = true, silent = true }
util.nmap(
  '<C-M-f>',
  "<cmd>lua require('fzf-lua').files()<CR>",
  buf_opt
)

local read_template = function(abs_path)
  local cmd = ':0r ' .. abs_path .. '<CR>'
  util.feedkeys(
    util.replace_termcodes(cmd, true, false, true),
    'm',
    true
  )
end

local replace_tags = function()
  local timestamp = vim.fn.strftime("%Y-%m-%d %a %H:%M")
  local cmd_timestamp = ":%s/{{ _timestamp_ }}/Created by " .. profile.author
  cmd_timestamp = cmd_timestamp.."(Github), "
  cmd_timestamp = cmd_timestamp .. timestamp .. "<CR>"
  local cmd_cursor = ":%s/.*{{ _cursor_ }}.*//<CR>"
  util.feedkeys(
    util.replace_termcodes(cmd_timestamp, true, false, true),
    'm',
    true
  )
  util.feedkeys(
    util.replace_termcodes(cmd_cursor, true, false, true),
    'm',
    true
  )
end

local template_path = profile.home .. "/.config/nvim/templates/"
util.nmap(
  '<C-M-t>',
  function()
    fzf_lua.files({
      cwd = template_path,
      preview = "bat --style=plain {}",
      fzf_opts = { ['--preview-window'] = 'nohidden,down,50%' },
      actions = {
        -- Use fzf-lua builtin actions or your own handler
        ['default'] = function(selected, opts)
          local file_name = selected[1]
          local abs_path = template_path .. string.gsub(file_name, "[\128-\255]", '')
          read_template(abs_path)
          replace_tags()
        end,
      }
    })
  end,
  buf_opt
)
