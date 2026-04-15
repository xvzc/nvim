return {
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    opts = {},
    keys = {
      { mode = { "n" }, "s", "ysiw", silent = true, remap = true },
      { mode = { "x" }, "s", "S", silent = true, remap = true },
    },
    -- event = "VeryLazy",
  },
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  opts = {
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
    },
  },
}
