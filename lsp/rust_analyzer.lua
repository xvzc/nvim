local lsp_util = require("lspconfig/util")
return {
  filetypes = { "rust" },
  root_dir = lsp_util.root_pattern("Cargo.toml"),
  settings = {
    ["rust-analyzer"] = {
      enabled = true,
      diagnostics = {
        enable = true,
        experimental = {
          enable = true,
        },
      },
      cargo = {
        allFeatures = true,
      },
      completion = { autocomplete = true },
    },
  },
}
