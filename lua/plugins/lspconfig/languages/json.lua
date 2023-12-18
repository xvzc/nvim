local lspconfig = require("lspconfig")
local common = require("plugins.lspconfig.common")

lspconfig.jsonls.setup {
  capabilities = common.capabilities,
  on_attach = function(client, bufnr)
    common.on_attach(client, bufnr)
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end
}
