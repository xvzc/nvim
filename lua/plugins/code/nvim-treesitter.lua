local enabled_languages = {
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
  "nix",
  -- "org",
}

local textobjects = {
  swap = {
    enable = true,
    swap_next = {
      ["g]"] = "@parameter.inner",
    },
    swap_previous = {
      ["g["] = "@parameter.inner",
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
      ["ac"] = "@conditional.outer",
      ["ic"] = "@conditional.inner",
      ["ap"] = "@parameter.outer",
      ["ip"] = "@parameter.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["ao"] = "@call.outer",
      ["io"] = "@call.inner",
      ["ar"] = "@return.outer",
      ["ir"] = "@return.inner",
      ["a/"] = "@comment.outer",
      ["i/"] = "@comment.inner",
      ["a="] = "@assignment.outer",
      ["i="] = "@assignment.inner",
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
      ["ix"] = "@number.inner",
      ["ax"] = "@number.outer",
    },
    selection_modes = {
      ["@parameter.outer"] = "v", -- charwise
      ["@function.outer"] = "V", -- linewise
      ["@function.inner"] = "V", -- linewise
      ["@class.outer"] = "<c-v>", -- blockwise
    },
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = enabled_languages,
  callback = function()
    vim.treesitter.start()
  end,
})

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- event = "VeryLazy",
  lazy = false,
  main = "nvim-treesitter.configs",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
  },
  opts = {
    auto_install = true,
    sync_install = false,
    ensure_installed = enabled_languages,
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
      disable = { "help" },
      additional_vim_regex_highlighting = { "org" },
    },
    textobjects = textobjects,
  },
}
