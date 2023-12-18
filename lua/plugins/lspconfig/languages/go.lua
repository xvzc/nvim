local lspconfig = require("lspconfig")
local common = require("plugins.lspconfig.common")

-- golang config
lspconfig.gopls.setup {
  capabilities = common.capabilities,
  on_attach = function()
    common.on_attach()
    vim.bo.tabstop = 2
  end
}

lspconfig.golangci_lint_ls.setup {
  capabilities = common.capabilities,
  on_attach = common.on_attach,
}
