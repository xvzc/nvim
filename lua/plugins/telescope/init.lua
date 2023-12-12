local util = require('util')
local telescope = require('telescope')
local actions = require('telescope.actions')
local common = require("plugins.telescope.common")

-- require("plugins.telescope.commander")
telescope.setup {
  defaults = util.table_merge(
    {
      results_title = false,
      preview_title = false,
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<C-s>"] = actions.cycle_previewers_next,
          ["<C-a>"] = actions.cycle_previewers_prev,
        },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--trim" -- add this value
      }
    }, common.theme.bottom_pane()
  ),
  pickers = {
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

local config_dir = vim.fn.stdpath "config" .. "/lua/plugins/telescope/custom"
for _, file in ipairs(vim.fn.readdir(config_dir, [[v:val =~ '\.lua$']])) do
  require('plugins.telescope.custom.' .. file:gsub('%.lua$', ''))
end

telescope.load_extension('fzf')
telescope.load_extension('skeleton')
telescope.load_extension('todo-comments')
