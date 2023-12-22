local telescope = require "telescope"
local common = require "plugins.telescope.common"
local builtin = require "telescope.builtin"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local custom = {
  {
    name = "find_all_files",
    func = builtin.find_files,
    opts = {
      hidden = true
    }
  },
  {
    name = "todo",
    func = telescope.extensions["todo-comments"].todo
  },
  {
    name = "load_templates",
    func = telescope.extensions.skeleton.load_template,
  },
  {
    name = "chezmoi",
    func = telescope.extensions.chezmoi.find_files,
  },
  {
    name = "edit_snippets",
    func = builtin.find_files,
    opts = {
      cwd = "~/.config/nvim/snippets"
    }
  },
  {
    name = "neovim_config",
    func = builtin.find_files,
    opts = {
      cwd = "~/.config/nvim",
      file_ignore_patterns = { "^snippets/" },
    }
  },
}

local exclude = { "fd", "builtin" }

local function make_commands(list, ignore)
  local ret = vim.deepcopy(list)
  for k, v in pairs(require("telescope.builtin")) do
    if not vim.tbl_contains(ignore, k) then
      table.insert(ret, { name = k, func = v })
    end
  end

  table.sort(ret, function(a, b) return a.name < b.name end)

  return ret
end

local function entry_maker(entry)
  return {
    value = entry,
    ordinal = entry.name,
    display = entry.name,
    func = entry.func,
    opts = entry.opts,
  }
end

local function attach_mappings(prompt_bufnr, _)
  actions.select_default:replace(function()
    actions.close(prompt_bufnr)
    local selection = action_state.get_selected_entry()
    selection.func(selection.opts or {})
  end)
  return true
end

-- our picker function: colors
local command_picker = function(opts)
  pickers.new(opts, {
    finder = finders.new_table {
      results = make_commands(custom, exclude),
      entry_maker = entry_maker,
    },
    attach_mappings = attach_mappings,
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
