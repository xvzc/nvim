return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  version = "8.12.0",
  ft = { "markdown", "Avante" },
  opts = {
    file_types = { "markdown", "Avante" },
    heading = {
      sign = false,
    },
    code = {
      enabled = true,
      sign = false,
      conceal_delimiters = false,
      border = "thin",
      language = true,
      position = "left",
    },
  },
}
