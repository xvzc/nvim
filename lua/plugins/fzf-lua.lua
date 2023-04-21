local fzf_lua = require('fzf-lua')
local util = require('util')

fzf_lua.setup {
  keymap = {
    builtin = {
      ['Tab'] = nil,
      ['<F1>'] = 'toggle-help',
      ['<F2>'] = 'toggle-preview',
      ['<F3>'] = 'toggle-preview-wrap',
      ['<C-e>'] = 'preview-page-up',
      ['<C-y>'] = 'preview-page-down',
    },
    fzf = {
      ['ctrl-e'] = nil,
    }
  },
  winopts = {
    on_create = function()
      -- creates a local buffer mapping translating <M-BS> to <C-u>
      vim.api.nvim_buf_set_keymap(0, 't', '<Tab>',
        "<cmd>lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, false, true), 'n', true)<CR>",
        { nowait = true, noremap = true })
      vim.api.nvim_buf_set_keymap(0, 't', '<S-Tab>',
        "<cmd>lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, false, true), 'n', true)<CR>",
        { nowait = true, noremap = true })
    end,
    height = 0.8,
    width = 0.8,
  }
}

local commands = {
  ['Files'] = function()
    fzf_lua.files({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['Templates'] = function()
    local template_path = vim.fn.stdpath('config') .. '/templates'
    fzf_lua.files({
      prompt = '>',
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
  end,
  ['Live grep'] = function()
    fzf_lua.live_grep({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['File commits'] = function()
    fzf_lua.git_bcommits({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['Project commits'] = function()
    fzf_lua.git_commits({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['Registers'] = function()
    fzf_lua.registers({
      prompt = '>',
    })
  end,
  ['Command history'] = function()
    fzf_lua.command_history({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['Neovim commands'] = function()
    fzf_lua.commands({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['References'] = function()
    fzf_lua.lsp_references({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['LSP Definitions'] = function()
    fzf_lua.lsp_definitions({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['LSP Declarations'] = function()
    fzf_lua.lsp_declarations({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['LSP Implementations'] = function()
    fzf_lua.lsp_implementations({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['LSP Document diagnostics'] = function()
    fzf_lua.lsp_document_diagnostics({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['LSP Workspace diagnostics'] = function()
    fzf_lua.lsp_workspace_diagnostics({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['Quick fix'] = function()
    fzf_lua.quickfix({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['Tabs'] = function()
    fzf_lua.tabs({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['buffers'] = function()
    fzf_lua.buffers({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['Jumps'] = function()
    fzf_lua.tabs({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['Code actions'] = function()
    fzf_lua.lsp_code_actions({
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
  ['Neovim configs'] = function()
    fzf_lua.files({
      cwd = '~/.config/nvim',
      prompt = '>',
      preview_opts = vim.o.columns < 95 and 'hidden' or 'nohidden',
    })
  end,
}

function commands.load()
  local keys = {}
  for key, _ in pairs(commands) do
    table.insert(keys, key)
  end

  table.sort(keys)

  fzf_lua.fzf_exec(keys, {
    actions = {
      ['default'] = function(selected, _)
        commands[selected[1]]()
      end,
      ['Tab'] = {
        function(_, _)
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
        end,
      }
    }
  })
end

local buf_opt = { noremap = true, silent = true }
util.nmap(
  '<C-g>',
  commands.load,
  buf_opt
)
