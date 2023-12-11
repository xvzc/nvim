local lspconfig = require("lspconfig")
local common = require("plugins.nvim-lspconfig.common")

-- typescript config
lspconfig.tsserver.setup {
  capabilities = common.capabilities,
  on_attach = common.on_attach,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx'
  },
  cmd = {
    'typescript-language-server',
    '--stdio',
  }
}

