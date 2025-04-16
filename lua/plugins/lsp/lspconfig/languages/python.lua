local lspconfig = require("lspconfig")
local common = require("plugins.lsp.lspconfig.common")

local pylint_ignore = {
  "missing-module-docstring",
  "missing-function-docstring",
  "too-many-branches",
}

-- python config
lspconfig.pylsp.setup({
  capabilities = common.capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    common.on_attach(client, bufnr)
  end,
  handlers = common.handlers,
  settings = {
    pylsp = {
      plugins = {
        black = { enabled = true },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        flake8 = {
          ignore = { "E203" },
          enabled = true,
        },
      },
    },
  },
})
