local lspconfig = require("lspconfig")
local common = require("plugins.lsp.lspconfig.common")

lspconfig.nixd.setup({
  capabilities = common.capabilities,
  on_attach = common.on_attch,
  settings = {
    nixd = {
      formatting = {
        command = { "alejandra" },
      },
    },
  },
})
