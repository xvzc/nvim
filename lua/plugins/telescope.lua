local util = require('util')
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    width = 0.5,
    show_line = false,
    results_title = false,
    preview_title = false,
    layout_config = {
      preview_width = 0.5,
      vertical = { width = 0.5 }

    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
      prompt_prefix = '🔍 ',
    },
    live_grep = {
      theme = "ivy",
      prompt_prefix = '🔍 ',
    }
  },
  extensions = {
    fzf = {
      -- fuzzy = true, -- false will only do exact matching
      -- override_generic_sorter = true, -- override the generic sorter
      -- override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')

-- local buf_opt = { noremap = true, silent = true }
-- util.nmap(
--   '<C-M-f>',
--   "<cmd>Telescope<CR>",
--   buf_opt
-- )
--
