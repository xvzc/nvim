local util = require('util')
local commander = require('commander')

commander.setup({
  integration = {
    telescope = {
      enable = true,
    }
  }
})

commander.add({
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
  {
    desc = "neovim_todo",
    cmd = "<CMD>TodoTelescope<CR>",
  },
})

local buf_opt = { noremap = true, silent = true }
util.nmap(
  '<C-g>',
  "<CMD>Telescope commander<CR>",
  buf_opt
)
