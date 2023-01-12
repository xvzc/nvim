local fzf_lua = require('fzf-lua')
local util = require('util')
local profile = require('profile')

fzf_lua.setup {
  keymap = {
    builtin = {
      ['<C-e>'] = 'preview-page-up',
      ['<C-y>'] = 'preview-page-down',
    },
  },
  winopts = {
    preview = {
      delay = 0
    },
    height = 0.8,
    width = 0.8,
  }
}

local function files()
  fzf_lua.files({
    prompt = 'FILES>',
    preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
  })
end

local function live_grep()
  fzf_lua.live_grep({
    prompt = 'LIVE_GREP>',
    preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
  })
end

local function templates()
  local template_path = vim.fn.stdpath('config') .. '/templates'
  fzf_lua.files({
    prompt = 'TEMPLATES>',
    file_icons = true,
    git_icons = false,
    cwd = template_path,
    preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    -- preview = "bat --style=plain {}",
    fzf_opts = { ['--preview-window'] = 'nohidden,down,50%' },
    actions = {
      ['default'] = function(selected, opts)
        local entry = fzf_lua.path.entry_to_file(selected[1])
        local abs_path = entry.path
        if not fzf_lua.path.starts_with_separator(abs_path) then
          abs_path = fzf_lua.path.join({ opts.cwd or vim.loop.cwd(), abs_path })
        end
        require('skeleton').load(abs_path)
      end,
    }
  })
end

local function commands()
  local command_table = {
    ['1) Files'] = files,
    ['2) Tamplates'] = templates,
    ['3) Live grep'] = live_grep,
  }

  local keys = {}
  for key, _ in pairs(command_table) do
    table.insert(keys, key)
  end

  table.sort(keys)

  fzf_lua.fzf_exec(keys, {
    actions = {
      ['default'] = function(selected, _)
        command_table[selected[1]]()
      end,
      ['1'] = function(_, _)
        command_table[keys[1]]()
      end,
      ['2'] = function(_, _)
        command_table[keys[2]]()
      end,
      ['3'] = function(_, _)
        command_table[keys[3]]()
      end,
    }
  })
end


local buf_opt = { noremap = true, silent = true }
util.nmap(
  '<C-g>',
  commands,
  buf_opt
)
