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

local function map_selection()
  local sel = function(query, scope)
    return function()
      require("nvim-treesitter-textobjects.select").select_textobject(query, scope)
    end
  end

  vim.keymap.set({ "o", "x" }, "af", sel("@function.outer", "textobjects"))
  vim.keymap.set({ "o", "x" }, "if", sel("@function.inner", "textobjects"))
  vim.keymap.set({ "o", "x" }, "ai", sel("@conditional.outer", "textobjects"))
  vim.keymap.set({ "o", "x" }, "ii", sel("@conditional.inner", "textobjects"))
  vim.keymap.set({ "o", "x" }, "aa", sel("@parameter.outer", "textobjects"))
  vim.keymap.set({ "o", "x" }, "ia", sel("@parameter.inner", "textobjects"))
  vim.keymap.set({ "o", "x" }, "al", sel("@loop.outer", "textobjects"))
  vim.keymap.set({ "o", "x" }, "il", sel("@loop.inner", "textobjects"))
  vim.keymap.set({ "o", "x" }, "aF", sel("@call.outer", "textobjects"))
  vim.keymap.set({ "o", "x" }, "iF", sel("@call.inner", "textobjects"))
  vim.keymap.set({ "o", "x" }, "ar", sel("@return.outer", "textobjects"))
  vim.keymap.set({ "o", "x" }, "ir", sel("@return.inner", "textobjects"))
  vim.keymap.set({ "o", "x" }, "ac", sel("@comment.outer", "textobjects"))
  vim.keymap.set({ "o", "x" }, "ic", sel("@comment.inner", "textobjects"))
  vim.keymap.set({ "o", "x" }, "a=", sel("@assignment.outer", "textobjects"))
  vim.keymap.set({ "o", "x" }, "i=", sel("@assignment.inner", "textobjects"))

  --   ["as"] = {
  --     query = "@scope.outer",
  --     query_group = "locals",
  --     desc = "Select language scope",
  --   },
  --   ["is"] = {
  --     query = "@scope.inner",
  --     query_group = "locals",
  --     desc = "Select language scope",
  --   },
  --   ["in"] = "@number.inner",
  --   ["an"] = "@number.outer",
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "master",
  -- event = "VeryLazy",
  lazy = false,
  main = "nvim-treesitter.configs",
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
  },
  config = function(opts)
    require("nvim-treesitter").setup(opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = enabled_languages,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
      init = function()
        map_selection()
      end,
      -- config = function(opts)
      --   require("nvim-treesitter-textobjects").setup(opts)
      -- end,
      opts = {
        swap = {
          enable = true,
          swap_next = {
            ["g]"] = "@parameter.inner",
          },
          swap_previous = {
            ["g["] = "@parameter.inner",
          },
        },
        -- move = {
        --   enable = true,
        -- },
        select = {
          enable = true,
          lookahead = true,
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "v", -- linewise
            ["@function.inner"] = "v", -- linewise
          },
        },
      },
    },
  },
}
