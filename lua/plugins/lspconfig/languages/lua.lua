local lspconfig = require("lspconfig")
local common = require("plugins.lspconfig.common")

-- lua config
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      -- diagnostics = {
      --   globals = { 'vim' },
      -- },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- removes asking for luassert
      },
      telemetry = {
        enable = false,
      },
    },
  },
  capabilities = common.capabilities,
  on_attach = function(client, bufnr)
    common.on_attach(client, bufnr)
  end
}
