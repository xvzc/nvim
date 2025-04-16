local lspconfig = require("lspconfig")
local common = require("plugins.lsp.lspconfig.common")

-- lua config
lspconfig.mdx_analyzer.setup({
  single_file_support = false,
  filetypes = { "markdown.mdx", "mdx" },
  capabilities = common.capabilities,
  on_attach = function(client, bufnr)
    common.on_attach(client, bufnr)
  end,
})
