local function config()
  local formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    -- You can customize some of the format options for the filetype
    -- See :help conform.format
    -- Conform will run the first available formatter
    c = { "clang-format" },
    sh = { "shfmt" },
    go = { "golangci-lint" },
    cpp = { "clang-format" },
    nix = { "nixfmt", lsp_format = "fallback" },
    lua = { "stylua" },
    python = { "black", lsp_format = "fallback" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
  }

  -- local test = vim.fn.map(vim.fn.keys(formatters_by_ft), function(each)
  --   return ipairs(each)[1]
  -- end)
  local it = vim.iter(formatters_by_ft):map(function(k, _)
    return "*." .. k
  end)

  require("conform").setup({
    formatters_by_ft = formatters_by_ft,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format({ bufnr = args.buf })
    end,
  })
end

return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  config = config,
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
