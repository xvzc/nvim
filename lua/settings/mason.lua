require("mason").setup({
    ensure_installed = { 'clangd', 'pyright', 'sumneko_lua' },
    automatic_installation = true,

    ui = {
        check_outdated_servers_on_open = true,

        border = "none",

        icons = {
            server_installed = "◍",
            server_pending = "◍",
            server_uninstalled = "◍",
        },
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
        },
    },

})

------------------------------------

local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    capabilities = capabilities,
    on_attach = on_attach,
    lsp_flags = {
      debounce_text_changes = 150,
    }
  }
end

local lua_config = {
  settings = {
      Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-------------------------------------

local lspconfig = require('lspconfig')
local config = make_config()

-------------------------------------

local python_config = config
lspconfig['pyright'].setup(python_config)

-------------------------------------

lspconfig['sumneko_lua'].setup(lua_config)

-------------------------------------

local sourcekit_config = config
sourcekit_config.filetypes = { "swift", "objective-c", "objective-cpp" };
lspconfig["sourcekit"].setup(sourcekit_config)

-------------------------------------

local go_config = config
lspconfig["gopls"].setup(go_config)

-------------------------------------

local cpp_config = config
cpp_config.filetypes = { "c", "cpp" }
cpp_config.cmd = {
  'clangd',
  '-header-insertion=never',
}
lspconfig["clangd"].setup(cpp_config)

-------------------------------------

local ts_config = config
ts_config.filetypes = {
  "javascript",
  "javascriptreact",
  "javascript.jsx",
  "typescript",
  "typescriptreact",
  "typescript.tsx"
}
ts_config.cmd = {
  'typescript-language-server',
  "--stdio",
}
lspconfig["tsserver"].setup(ts_config)

-------------------------------------

local tf_config = config
lspconfig.terraformls.setup(tf_config)

-------------------------------------

lspconfig.tflint.setup{}

-------------------------------------
--
