local lspconfig = require("lspconfig")
local common = require("plugins.lspconfig.common")

-- clangd config
local capabilities = common.capabilities
capabilities.offsetEncoding = { "utf-16" }

lspconfig.clangd.setup {
  filetypes = { "c", "cpp" },
  cmd = {
    'clangd',
    '--header-insertion=never',
    "--query-driver='~/.config/assets/clangd/**'",
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common.on_attach(client, bufnr)
    -- client.server_capabilities.documentFormattingProvider = false
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
}
