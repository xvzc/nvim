return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    formatters_by_ft = {
      -- Conform will run multiple formatters sequentially
      -- You can customize some of the format options for the filetype
      -- See :help conform.format
      -- Conform will run the first available formatter
      c = { "clang-format" },
      sh = { "shfmt" },
      cpp = { "clang-format" },
      nix = { "nixfmt", lsp_format = "fallback" },
      lua = { "stylua" },
      python = { "black", lsp_format = "fallback" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
  keys = {
    {
      mode = { "n" },
      "<C-g>",
      function()
        require("conform").format({ async = true })
      end,
    },
  },
}
