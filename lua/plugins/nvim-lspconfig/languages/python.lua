local lspconfig = require("lspconfig")
local common = require("plugins.nvim-lspconfig.common")

-- python config
lspconfig.pylsp.setup {
  capabilities = common.capabilities,
  on_attach = common.on_attach,
  settings = {
    pylsp = {
      plugins = {
        black = { enabled = true },
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100
        }
      }
    }
  }
}

