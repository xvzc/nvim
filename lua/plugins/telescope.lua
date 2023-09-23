local util = require('util')

local telescope = require('telescope')
local actions = require('telescope.actions')

local ivy = {
  prompt_prefix = '🔍 ',
  sorting_strategy = "ascending",
  layout_strategy = "bottom_pane",
  layout_config = {
    height = 25,
  },
  border = true,
  borderchars = {
    prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    results = { "─", " ", "─", "│", "├", "┤", "─", "└" },
    preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
  },
  results_title = false,
  preview_title = false,
}

local ivy_no_preview = vim.deepcopy(ivy)
ivy_no_preview.preview = false

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
    }, ivy),
  pickers = {
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    command_center = {
      separator = " ",
      auto_replace_desc_with_cmd = false,
      prompt_title = "Actions",
      theme = function(opts)
        local theme = require("telescope.themes").command_center(opts)
        theme.borderchars.prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
        theme.borderchars.results = { "─", "│", "─", "│", "├", "┤", "┘", "└" }
        theme.borderchars.preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
        return theme
      end,
    }
  },
}

telescope.load_extension('fzf')
telescope.load_extension("commander")
telescope.load_extension('skeleton')

