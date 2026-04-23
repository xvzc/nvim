return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    enabled = true,
    event = "VeryLazy",
    init = function()
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })
    end,
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          -- Conform will run multiple formatters sequentially
          -- You can customize some of the format options for the filetype
          -- See :help conform.format
          -- Conform will run the first available formatter
          typst = { "typstyle", lsp_format = "fallback" },
          c = { "clang-format" },
          sh = { "shfmt" },
          go = { "golangci-lint" },
          cpp = { "clang-format" },
          nix = { "nixfmt", lsp_format = "fallback" },
          lua = { "stylua" },
          python = { "black", lsp_format = "fallback" },
          rust = { "rustfmt", lsp_format = "fallback" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          terraform = { "terraform_fmt", lsp_format = "fallback" },
        },
      })
      require("conform").formatters.injected = {
        -- Set the options field
        options = {
          -- Set individual option values
          ignore_errors = true,
          lang_to_formatters = {
            lua = { "stylua" },
          },
        },
      }
    end,
    keys = {
      {
        mode = { "n" },
        "<C-g>",
        function()
          require("conform").format({ async = true })
        end,
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    opts = {},
    config = true,
  },
}
