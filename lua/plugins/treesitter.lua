local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

treesitter.setup({
  auto_install = true,
  sync_install = false,
  ignore_install = {},
  modules = {},
  indent = {
    enable = true,
  },
  ensure_installed = {
    "c",
    "cpp",
    "go",
    "lua",
    "vim",
    "bash",
    "dockerfile",
    "kotlin",
    "java",
    "python",
    "regex",
    "ruby",
    "tsx",
    "typescript",
    "javascript",
    "hcl",
    "cmake",
    "markdown",
    "gomod",
    "sql",
    "terraform",
    "org"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'org' },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
    },
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      -- You can optionally set descriptions to the mappings (used in the desc parameter of
      -- nvim_buf_set_keymap) which plugins like which-key display
      ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      -- You can also use captures from other query groups like `locals.scm`
      ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
    },
  },
})

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
