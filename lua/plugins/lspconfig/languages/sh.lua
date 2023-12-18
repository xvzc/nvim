local lspconfig = require("lspconfig")
local common = require("plugins.lspconfig.common")

require 'lspconfig'.bashls.setup {
  capabilities = common.capabilities,
  on_attach = function(client, bufnr)
    common.on_attach(client, bufnr)
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end
}
