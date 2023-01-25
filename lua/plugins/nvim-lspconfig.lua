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


  util.nmap('<C-l>', function(nr)
    vim.lsp.buf.format({ async = true, bufnr = nr, })
  end, buf_opts)

  if client.name ~= 'jsonls' then
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

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Lsp finder find the symbol definition implement reference
  -- if there is no implement it will hide
  -- when you use action in finder like open vsplit then you can
  -- use <C-t> to jump back
  util.nmap("gf", "<cmd>Lspsaga lsp_finder<CR>", buf_opts)

  -- Code action
  util.nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", buf_opts)
  util.vmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", buf_opts)

  -- Rename
  util.nmap("<leader>rn", "<cmd>Lspsaga rename ++project<CR>", buf_opts)
  -- util.nmap("<leader>rn", vim.lsp.buf.rename, buf_opts)

  -- Show line diagnostics
  util.nmap("<leader>i", "<cmd>Lspsaga show_line_diagnostics<CR>", buf_opts)

  -- Show cursor diagnostic
  -- global.nmap("<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

  -- Diagnsotic jump can use `<c-o>` to jump back
  util.nmap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", buf_opts)
  util.nmap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", buf_opts)

  -- Only jump to error
  -- util.nmap("[e", function()
  --   require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  -- end, { silent = true })
  --
  -- util.nmap("]e", function()
  --   require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  -- end, { silent = true })

  -- Outline
  util.nmap("<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
  util.nmap("<leader>h", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buf_opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buf_opts)

  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, buf_optss)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, buf_opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, buf_opts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, buf_opts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, buf_opts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, buf_opts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, buf_opts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, buf_opts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, buf_opts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, buf_opts)
end

local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  return {
    capabilities = capabilities,
    on_attach = on_attach,
    lsp_flags = {
      debounce_text_changes = 150,
    },
  }
end

local lua_config = make_config()
lua_config.settings = {
  Lua = {
    runtime = {
      version = 'LuaJIT',
    },
    diagnostics = {
      globals = { 'vim' },
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true),
    },
    telemetry = {
      enable = false,
    },
  },
}

-- python config

local python_config = make_config()
lspconfig.pyright.setup(python_config)

-- lua config

lspconfig.sumneko_lua.setup(lua_config)

-- source-kit config

local sourcekit_config = make_config()
sourcekit_config.filetypes = { "swift", "objective-c", "objective-cpp" };
lspconfig.sourcekit.setup(sourcekit_config)

-- golang config
local go_config = make_config()
lspconfig.gopls.setup(go_config)

local golangci_lint_ls_config = make_config()
lspconfig.golangci_lint_ls.setup(golangci_lint_ls_config)

-- clangd config
local cpp_config = make_config()
cpp_config.filetypes = { "c", "cpp" }
cpp_config.capabilities.offsetEncoding = { "utf-16" }
cpp_config.cmd = {
  'clangd',
  '-header-insertion=never',
}
lspconfig.clangd.setup(cpp_config)

-- typescript config
local ts_config = make_config()
ts_config.filetypes = {
  'javascript',
  'javascriptreact',
  'javascript.jsx',
  'typescript',
  'typescriptreact',
  'typescript.tsx'
}

ts_config.cmd = {
  'typescript-language-server',
  '--stdio',
}
lspconfig.tsserver.setup(ts_config)

-- terraform config
local tf_config = make_config()
tf_config.filetypes = {
  "terraform",
  "tf",
  "hcl",
}

lspconfig.terraformls.setup(tf_config)
lspconfig.tflint.setup(tf_config)

-- json config
local jsonls_config = make_config()
lspconfig.jsonls.setup(jsonls_config)


-- until this issue solved: https://github.com/neovim/neovim/issues/20456
vim.cmd [[
augroup MyLuaHLBugFix
  autocmd!
  autocmd! ColorScheme,VimEnter * highlight! link luaParenError Normal | highlight! link luaError Normal
augroup END
]]
