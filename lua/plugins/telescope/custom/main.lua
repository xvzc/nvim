local telescope = require "telescope"
local common = require "plugins.telescope.common"
local builtin = require "telescope.builtin"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local util = require("util")
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local commands = {
  {
    name = "Find files",
    func = builtin.find_files,
  },
  {
    name = "Find all files",
    func = builtin.find_files,
    opts = {
      hidden = true
    }
  },
  {
    name = "Find live grep",
    func = builtin.live_grep,
  },
  {
    name = "Git buffer commits",
    func = builtin.git_bcommits
  },
  {
    name = "Git commits",
    func = builtin.git_commits
  },
  {
    name = "Git stash",
    func = builtin.git_stash
  },
  {
    name = "Git branches",
    func = builtin.git_branches
  },
  {
    name = "LSP diagnostics",
    func = builtin.lsp_diagnostics
  },
  {
    name = "LSP definitions",
    func = builtin.lsp_definitions
  },
  {
    name = "LSP references",
    func = builtin.lsp_references
  },
  {
    name = "LSP implementations",
    func = builtin.implementations
  },
  {
    name = "Misc registers",
    func = builtin.registers
  },
  {
    name = "Misc search in buffer",
    func = builtin.current_buffer_fuzzy_find
  },
  {
    name = "Misc To-do",
    func = telescope.extensions["todo-comments"].todo
  },
  {
    name = "Misc Laod templates",
    func = telescope.extensions.skeleton.load_template,
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
        selection.func(selection.opts)
      end)
      return true
    end,
    sorter = conf.generic_sorter(opts),
  }):find()
end

-- to execute the function
local buf_opt = { noremap = true, silent = true }
util.nmap(
  '<C-g>',
  function() command_picker(common.theme.dropdown()) end,
  buf_opt
)
