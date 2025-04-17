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
    "query",
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
    -- "org",
  },
  highlight = {
    enable = true,
    disable = { "help" },
    additional_vim_regex_highlighting = { "org" },
  },
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["<leader>]"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>["] = "@parameter.inner",
      },
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        ["an"] = "@parameter.outer",
        ["in"] = "@parameter.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["ao"] = "@call.outer",
        ["io"] = "@call.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ar"] = "@return.outer",
        ["ir"] = "@return.inner",
        ["cc"] = "@comment.outer",
        ["n"] = "@number.inner",
        ["aa"] = "@assignment.outer",
        ["ia"] = "@assignment.inner",
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        ["is"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V", -- linewise
        ["@function.inner"] = "V", -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
      },
    },
  },
})

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

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
