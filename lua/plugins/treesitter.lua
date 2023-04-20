local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

treesitter.setup({
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
    "yaml",
    "hcl",
    "cmake",
    "markdown",
    "gomod",
    "sql",
  },
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
    -- additional_vim_regex_highlighting = false
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["am"] = "@function.outer",
        ["im"] = "@function.inner",
        ["al"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["il"] = {
          query = "@class.inner",
          desc = "Select inner part of a class region"
        },
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["ad"] = "@conditional.outer",
        ["id"] = "@conditional.inner",
        ["ao"] = "@loop.outer",
        ["io"] = "@loop.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@call.outer",
        ["if"] = "@call.inner",
        ["ac"] = "@comment.outer",
        ["ar"] = "@frame.outer",
        ["ir"] = "@frame.inner",
        ["at"] = "@attribute.outer",
        ["it"] = "@attribute.inner",
        ["ae"] = "@scopename.inner",
        ["ie"] = "@scopename.inner",
        ["as"] = "@statement.outer",
        ["is"] = "@statement.outer",
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V',  -- linewise
        ['@function.inner'] = 'V',  -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      include_surrounding_whitespace = true,
    },
    swap = {
      enable = true,
      swap_next = {
        [")m"] = "@function.outer",
        [")c"] = "@comment.outer",
        [")a"] = "@parameter.inner",
        [")b"] = "@block.outer",
        [")C"] = "@class.outer",
      },
      swap_previous = {
        ["(m"] = "@function.outer",
        ["(c"] = "@comment.outer",
        ["(a"] = "@parameter.inner",
        ["(b"] = "@block.outer",
        ["(C"] = "@class.outer",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]f"] = "@call.outer",
        ["]d"] = "@conditional.outer",
        ["]o"] = "@loop.outer",
        ["]s"] = "@statement.outer",
        ["]a"] = "@parameter.outer",
        ["]c"] = "@comment.outer",
        ["]b"] = "@block.outer",
        ["]l"] = { query = "@class.outer", desc = "next class start" },
        ["]r"] = "@frame.outer",
        ["]t"] = "@attribute.outer",
        ["]e"] = "@scopename.outer",
        ["]]m"] = "@function.inner",
        ["]]f"] = "@call.inner",
        ["]]d"] = "@conditional.inner",
        ["]]o"] = "@loop.inner",
        ["]]a"] = "@parameter.inner",
        ["]]b"] = "@block.inner",
        ["]]l"] = { query = "@class.inner", desc = "next class start" },
        ["]]r"] = "@frame.inner",
        ["]]t"] = "@attribute.inner",
        ["]]e"] = "@scopename.inner",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]F"] = "@call.outer",
        ["]D"] = "@conditional.outer",
        ["]O"] = "@loop.outer",
        ["]S"] = "@statement.outer",
        ["]A"] = "@parameter.outer",
        ["]C"] = "@comment.outer",
        ["]B"] = "@block.outer",
        ["]L"] = "@class.outer",
        ["]R"] = "@frame.outer",
        ["]T"] = "@attribute.outer",
        ["]E"] = "@scopename.outer",
        ["]]M"] = "@function.inner",
        ["]]F"] = "@call.inner",
        ["]]D"] = "@conditional.inner",
        ["]]O"] = "@loop.inner",
        ["]]A"] = "@parameter.inner",
        ["]]B"] = "@block.inner",
        ["]]L"] = "@class.inner",
        ["]]R"] = "@frame.inner",
        ["]]T"] = "@attribute.inner",
        ["]]E"] = "@scopename.inner",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[f"] = "@call.outer",
        ["[d"] = "@conditional.outer",
        ["[o"] = "@loop.outer",
        ["[s"] = "@statement.outer",
        ["[a"] = "@parameter.outer",
        ["[c"] = "@comment.outer",
        ["[b"] = "@block.outer",
        ["[l"] = "@class.outer",
        ["[r"] = "@frame.outer",
        ["[t"] = "@attribute.outer",
        ["[e"] = "@scopename.outer",
        ["[[m"] = "@function.inner",
        ["[[f"] = "@call.inner",
        ["[[d"] = "@conditional.inner",
        ["[[o"] = "@loop.inner",
        ["[[a"] = "@parameter.inner",
        ["[[b"] = "@block.inner",
        ["[[l"] = "@class.inner",
        ["[[r"] = "@frame.inner",
        ["[[t"] = "@attribute.inner",
        ["[[e"] = "@scopename.inner",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[F"] = "@call.outer",
        ["[D"] = "@conditional.outer",
        ["[O"] = "@loop.outer",
        ["[S"] = "@statement.outer",
        ["[A"] = "@parameter.outer",
        ["[C"] = "@comment.outer",
        ["[B"] = "@block.outer",
        ["[L"] = "@class.outer",
        ["[R"] = "@frame.outer",
        ["[T"] = "@attribute.outer",
        ["[E"] = "@scopename.outer",
        ["[[M"] = "@function.inner",
        ["[[F"] = "@call.inner",
        ["[[D"] = "@conditional.inner",
        ["[[O"] = "@loop.inner",
        ["[[A"] = "@parameter.inner",
        ["[[B"] = "@block.inner",
        ["[[L"] = "@class.inner",
        ["[[R"] = "@frame.inner",
        ["[[T"] = "@attribute.inner",
        ["[[E"] = "@scopename.inner",
      },
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
