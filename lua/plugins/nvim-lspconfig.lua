local lspconfig = require('lspconfig')
local util = require('util')

vim.diagnostic.config({
  float = {
    focusable = false,
    source = 'always',
    border = 'rounded',
    header = '',
    prefix = '',
  },
  virtual_text = false
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    update_in_insert = false,
  })

-- :help vim.lsp.diagnostic.on_publish_diagnostics
local on_attach = function(client, bufnr)
  local buf_opts = { noremap = true, silent = true, buffer = bufnr }
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
  end

  local capabilities = client.server_capabilities
  if capabilities.document_highlight then
    util.autocmd({ 'CursorHold', 'CursorHoldI' }, {
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
      buffer = 0
    })
  end

  util.autocmd({ 'CursorMoved' }, {
    callback = function()
      vim.lsp.buf.clear_references()
    end,
    buffer = 0
  })

  util.nmap('<C-l>', function(nr)
    vim.lsp.buf.format({ async = true, bufnr = nr, })
  end, buf_opts)

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  util.nmap("gf", "<cmd>Lspsaga lsp_finder<CR>", buf_opts)

  -- Code action
  util.vmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", buf_opts)
  util.nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", buf_opts)
  util.nmap("<leader>rn", "<cmd>Lspsaga rename ++project<CR>", buf_opts)
  util.nmap("<leader>i", "<cmd>Lspsaga show_line_diagnostics<CR>", buf_opts)
  util.nmap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", buf_opts)
  util.nmap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", buf_opts)
  util.nmap("<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
  util.nmap("<leader>h", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

  util.nmap('gd', vim.lsp.buf.definition, buf_opts)
  util.nmap('gi', vim.lsp.buf.implementation, buf_opts)
  util.nmap('K', vim.lsp.buf.signature_help, buf_opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lua config
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- removes asking for luassert
      },
      telemetry = {
        enable = false,
      },
    },
  },
  capabilities = capabilities,
  on_attach = on_attach,
}

-- python config
lspconfig.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}


-- source-kit config
lspconfig.sourcekit.setup({
  filetypes = { "swift", "objective-c", "objective-cpp" },
  capabilities = capabilities,
  on_attach = on_attach,
})
--
-- golang config
lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.golangci_lint_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- clangd config
local clangd_capabilities = vim.lsp.protocol.make_client_capabilities()
clangd_capabilities.textDocument.completion.completionItem.snippetSupport = true
clangd_capabilities.offsetEncoding = { "utf-16" }
lspconfig.clangd.setup {
  capabilities = clangd_capabilities,
  on_attach = on_attach,
  filetypes = { "c", "cpp" },
  cmd = {
    'clangd',
    '-header-insertion=never',
  },
}

-- typescript config
lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
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


-- terraform config
lspconfig.terraformls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lspconfig.tflint.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- until this issue solved: https://github.com/neovim/neovim/issues/20456
vim.cmd [[
augroup MyLuaHLBugFix
  autocmd!
  autocmd! ColorScheme,VimEnter * highlight! link luaParenError Normal | highlight! link luaError Normal
augroup END
]]

local M = {
  on_attach = on_attach
}

return M
