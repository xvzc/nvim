require("lazy").setup({
  spec = {
    {
      performance = {
        cache = {
          enabled = true,
        },
      },
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    { import = "plugins.code" },
    { import = "plugins.ui" },
    { import = "plugins.util" },
  },
})
