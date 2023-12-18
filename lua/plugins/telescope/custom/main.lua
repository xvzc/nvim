local telescope = require "telescope"
local common = require "plugins.telescope.common"
local builtin = require "telescope.builtin"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local commands = {
  {
    name = "find files",
    func = builtin.find_files,
  },
  {
    name = "find all files",
    func = builtin.find_files,
    opts = {
      hidden = true
    }
  },
  {
    name = "ripgrep",
    func = builtin.live_grep,
  },
  {
    name = "git buffer commits",
    func = builtin.git_bcommits
  },
  {
    name = "git commits",
    func = builtin.git_commits
  },
  {
    name = "git stash",
    func = builtin.git_stash
  },
  {
    name = "git branches",
    func = builtin.git_branches
  },
  {
    name = "lsp diagnostics",
    func = builtin.diagnostics
  },
  {
    name = "lsp definitions",
    func = builtin.lsp_definitions
  },
  {
    name = "lsp references",
    func = builtin.lsp_references
  },
  {
    name = "lsp implementations",
    func = builtin.implementations
  },
  {
    name = "registers",
    func = builtin.registers
  },
  {
    name = "search in buffer",
    func = builtin.current_buffer_fuzzy_find
  },
  {
    name = "todo",
    func = telescope.extensions["todo-comments"].todo
  },
  {
    name = "load templates",
    func = telescope.extensions.skeleton.load_template,
  },
  {
    name = "chezmoi",
    func = telescope.extensions.chezmoi.find_files,
  },
  {
    name = "edit snippets",
    func = builtin.find_files,
    opts = {
      cwd = "~/.config/nvim/snippets"
    }
  },
  {
    name = "neovim config",
    func = builtin.find_files,
    opts = {
      cwd = "~/.config/nvim"
    }
  },
}

local flatten = function(tbl)
  local results = {}
  for _, command in ipairs(tbl) do
    local item = { command.name, command.func }
    if command.opts ~= nil then
      table.insert(item, command.opts)
    end
    table.insert(results, item)
  end

  return results
end

-- our picker function: colors
local command_picker = function(opts)
  pickers.new(opts, {
    prompt_title = "Actions",
    finder = finders.new_table {
      results = flatten(commands),
      entry_maker = function(entry)
        return {
          value = entry,
          ordinal = entry[1],
          display = entry[1],
          func = entry[2],
          opts = entry[3]
        }
      end
    },
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        selection.func(selection.opts or {})
      end)
      return true
    end,
    sorter = conf.generic_sorter(opts),
  }):find()
end

-- to execute the function
local buf_opt = { noremap = true, silent = true }
vim.keymap.set('n',
  '<C-g>',
  function() command_picker(common.theme.dropdown()) end,
  buf_opt
)
