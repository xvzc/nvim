return {
  "xvzc/skeleton.nvim",
  opts = {
    template_path = vim.fn.stdpath("config") .. "/templates",
    patterns = {
      cpp = { "*" },
    },
    tags = {
      author = "xvzc",
    },
  },
}
