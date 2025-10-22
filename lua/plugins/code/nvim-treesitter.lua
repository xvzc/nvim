local keys = {
  {
    mode = { "n", "x", "o" },
    ";",
    function()
      require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move()
    end,
  },
  {
    mode = { "n", "x", "o" },
    ",",
    function()
      require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move_opposite()
    end,
  },

  {
    mode = { "n", "x", "o" },
    "f",
    function()
      require("nvim-treesitter.textobjects.repeatable_move").builtin_f()
    end,
  },
  {
    mode = { "n", "x", "o" },
    "F",
    function()
      require("nvim-treesitter.textobjects.repeatable_move").builtin_F()
    end,
  },
  {
    mode = { "n", "x", "o" },
    "t",
    function()
      require("nvim-treesitter.textobjects.repeatable_move").builtin_t()
    end,
  },
  {
    mode = { "n", "x", "o" },
    "T",
    function()
      require("nvim-treesitter.textobjects.repeatable_move").builtin_T()
    end,
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  event = "VeryLazy",
  keys = keys,
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  opts = {
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
          ["aa"] = "@assignment.outer",
          ["ia"] = "@assignment.inner",
          ["as"] = {
            query = "@scope",
            query_group = "locals",
            desc = "Select language scope",
          },
          ["is"] = {
            query = "@scope",
            query_group = "locals",
            desc = "Select language scope",
          },
          ["n"] = "@number.inner",
        },
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@function.inner"] = "V", -- linewise
          ["@class.outer"] = "<c-v>", -- blockwise
        },
      },
    },
  },
}
