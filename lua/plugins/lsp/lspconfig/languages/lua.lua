local lspconfig = require("lspconfig")
local common = require("plugins.lsp.lspconfig.common")

-- lua config
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false, -- removes asking for luassert
      },
      telemetry = {
        enable = false,
      },
    },
  },
  capabilities = common.capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    local workspace = client.config.settings.Lua.workspace
    workspace.library = vim.api.nvim_get_runtime_file("lua", true)

    common.on_attach(client, bufnr)
  end,
  handlers = common.handlers,
})
