require("mason").setup({
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

local mason_registry = require('mason-registry')
local ensure_installed = {
  'lua-language-server',
  'typescript-language-server',
  'pyright',
  'clangd',
  'eslint_d',
  'prettierd',
  'black',
}

local servers = ''
for _, name in ipairs(ensure_installed) do
  if not mason_registry.is_installed(name) then
    servers = servers..' '..name
  end
end

if servers ~= '' then
  vim.cmd(':MasonInstall '..servers)
end

