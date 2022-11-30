local lspconfig = require('lspconfig')
local global = require('global')

vim.diagnostic.config({
  float = {
    focusable = false,
    source = 'always',
    border = 'rounded',
    header = '',
    prefix = '',
  },
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

-- local ignored_formatter = { "tsserver", "json_tool" }
local do_format = function(bufnr)
  vim.lsp.buf.format({
    async = true,
    bufnr = bufnr,
    filter = function(client)
      return client.name == "null-ls"
    end,
  })
end
--
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- :help vim.lsp.diagnostic.on_publish_diagnostics
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
  end

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.keymap.set('n', '<C-M-f>', do_format, bufopts)
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Lsp finder find the symbol definition implement reference
  -- if there is no implement it will hide
  -- when you use action in finder like open vsplit then you can
  -- use <C-t> to jump back
  global.nmap("gr", "<cmd>Lspsaga lsp_finder<CR>", bufopts)

  -- Code action
  global.nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
  global.vmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)

  -- Rename
  global.nmap("<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts)

  -- Show line diagnostics
  global.nmap("<leader>i", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)

  -- Show cursor diagnostic
  -- global.nmap("<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

  -- Diagnsotic jump can use `<c-o>` to jump back
  global.nmap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
  global.nmap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)

  -- Only jump to error
  global.nmap("[e", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, { silent = true })

  global.nmap("]e", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, { silent = true })

  -- Outline
  global.nmap("<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })

  -- Hover Doc
  global.nmap("<leader>h", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<C-M-f>', function()
    vim.lsp.buf.format {
      async = true,
    }
  end, bufopts)
end

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
lspconfig['pyright'].setup(python_config)

-- lua config

lspconfig['sumneko_lua'].setup(lua_config)

-- source-kit config

local sourcekit_config = make_config()
sourcekit_config.filetypes = { "swift", "objective-c", "objective-cpp" };
lspconfig["sourcekit"].setup(sourcekit_config)

-- golang config

local go_config = make_config()
lspconfig["gopls"].setup(go_config)

-- clangd config

local cpp_config = make_config()
cpp_config.filetypes = { "c", "cpp" }
cpp_config.cmd = {
  'clangd',
  '-header-insertion=never',
}
lspconfig["clangd"].setup(cpp_config)

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
lspconfig["tsserver"].setup(ts_config)

-- terraform config
local tf_config = make_config()
tf_config.filetypes = {
  "terraform",
  "tf",
  "hcl",
}

lspconfig.terraformls.setup(tf_config)
-- lspconfig.tflint.setup(tf_config)

-- until this issue solved: https://github.com/neovim/neovim/issues/20456
vim.cmd[[
augroup MyLuaHLBugFix
  autocmd!
  autocmd! ColorScheme,VimEnter * highlight! link luaParenError Normal | highlight! link luaError Normal
augroup END

]]
