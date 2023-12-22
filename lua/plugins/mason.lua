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
  'prettierd',
  'eslint_d',
  'json-lsp',
  'black',
  'clangd',
  'clang-format',
  'fixjson',
  'goimports',
  'golangci-lint-langserver',
  'golines',
  'gomodifytags',
  'gopls',
  'lua-language-server',
  'python-lsp-server',
  'rust-analyzer',
  'rustfmt',
  'terraform-ls',
  'tflint',
  'typescript-language-server',
  'bash-language-server',
  'shfmt',
  'shellcheck'
}

local clangd = vim.F.npcall(require('mason-registry').get_package, 'clangd')
if clangd then
  clangd:on("install:success", vim.schedule_wrap(function()
    local include_path = vim.fn.globpath(clangd:get_install_path(), "**/include")
    vim.fn.system("cp -r ~/.config/assets/clangd/bits " .. include_path)
  end))
end

local servers = ''
for _, name in ipairs(ensure_installed) do
  if not mason_registry.is_installed(name) then
    servers = servers .. ' ' .. name
  end
end

if servers ~= '' then
  vim.cmd(':MasonInstall ' .. servers)
end
