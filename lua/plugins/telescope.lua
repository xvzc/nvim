local util = require('util')

local telescope = require('telescope')
local actions = require('telescope.actions')
local command_center = require('command_center')

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
telescope.load_extension("command_center")
telescope.load_extension('skeleton')

command_center.add({
  {
    desc = "find_files",
    cmd = "<CMD>Telescope find_files<CR>",
  },
  {
    desc = "find_hidden_files",
    cmd = "<CMD>Telescope find_files hidden=true<CR>",
  },
  {
    desc = "find_in_files",
    cmd = "<CMD>Telescope live_grep<CR>",
  },
  {
    desc = "load_templates",
    cmd = "<CMD>Telescope skeleton<CR>",
  },
  {
    desc = "git_buffer_commits",
    cmd = "<CMD>Telescope git_bcommits<CR>",
  },
  {
    desc = "git_commits",
    cmd = "<CMD>Telescope git_commits<CR>",
  },
  {
    desc = "git_stash",
    cmd = "<CMD>Telescope git_stash<CR>",
  },
  {
    desc = "git_branches",
    cmd = "<CMD>Telescope git_branches<CR>",
  },
  {
    desc = "lsp_diagnostics",
    cmd = "<CMD>Telescope diagnostics<CR>",
  },
  {
    desc = "lsp_definitions",
    cmd = "<CMD>Telescope lsp_definitions<CR>",
  },
  {
    desc = "lsp_references",
    cmd = "<CMD>Telescope lsp_references<CR>",
  },
  {
    desc = "lsp_implementations",
    cmd = "<CMD>Telescope lsp_implementations<CR>",
  },
  {
    desc = "neovim_registers",
    cmd = "<CMD>Telescope registers<CR>",
  },
  {
    desc = "neovim_search_in_buffer",
    cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
  },
})

local buf_opt = { noremap = true, silent = true }
util.nmap(
  '<C-g>',
  "<CMD>Telescope command_center<CR>",
  buf_opt
)
