local lspconfig = require("lspconfig")
local common = require("plugins.lspconfig.common")
local mason_registry = require("mason-registry")

-- clangd config
local capabilities = vim.deepcopy(common.capabilities)
capabilities.offsetEncoding = { "utf-16" }

lspconfig.clangd.setup {
  filetypes = { "c", "cpp" },
  cmd = {
    'clangd',
    '--header-insertion=never',
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common.on_attach(client, bufnr)
    -- client.server_capabilities.documentFormattingProvider = false
  end,
}
