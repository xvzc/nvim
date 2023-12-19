local lspconfig = require("lspconfig")
local common = require("plugins.lspconfig.common")
local mason_registry = require("mason-registry")

-- clangd config
local capabilities = vim.deepcopy(common.capabilities)
capabilities.offsetEncoding = { "utf-16" }

lspconfig.clangd.setup {
  filetypes = { "c", "cpp" },
  cmd = {
    'clangd',
    '--header-insertion=never',
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common.on_attach(client, bufnr)
    -- client.server_capabilities.documentFormattingProvider = false
    local codelldb = mason_registry.get_package("clangd")
    local install_path = codelldb:get_install_path()
    local include_path = vim.fn.globpath(install_path, "**/include")
    if vim.fn.isdirectory(include_path .. "/bits") == 0 then
      vim.fn.system("cp -r ~/.config/assets/clangd/bits " .. include_path)
      vim.defer_fn(function()
        pcall(vim.diagnostic.reset)
        vim.notify("Copied bit/stdc++.h header")
      end, 500)
    end

    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
}
