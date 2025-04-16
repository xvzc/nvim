local lspconfig = require("lspconfig")
local common = require("plugins.lsp.lspconfig.common")

-- clangd config
local capabilities = vim.deepcopy(common.capabilities)
capabilities.offsetEncoding = { "utf-16" }

lspconfig.clangd.setup({
  filetypes = { "c", "cpp" },
  cmd = {
    "clangd",
    "--header-insertion=never",
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- client.server_capabilities.documentFormattingProvider = false
    common.on_attach(client, bufnr)
  end,
  handlers = common.handlers,
})
