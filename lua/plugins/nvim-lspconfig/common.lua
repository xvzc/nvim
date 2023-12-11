-- :help vim.lsp.diagnostic.on_publish_diagnostics
local util = require("util")
local List = require('plenary.collections.py_list')

local on_attach = function(client, bufnr)
  local buf_opts = { noremap = true, silent = true, buffer = bufnr }

  local ignores = List { "tsserver", "cpp" }
  if ignores:contains(client.name) then
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
  end
  client.server_capabilities.semanticTokensProvider = nil

  if client.server_capabilities.document_highlight then
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

  util.nmap("<leader>gc", "<cmd>Lspsaga code_action<CR>", buf_opts)
  util.nmap("gd", "<cmd>Lspsaga finder def<CR>", buf_opts)
  util.nmap("gr", "<cmd>Lspsaga finder ref<CR>", buf_opts)
  util.nmap("gi", "<cmd>Lspsaga finder imp<CR>", buf_opts)
  util.nmap(
    "<leader>i",
    "<cmd>Lspsaga show_line_diagnostics ++unfocus<CR>",
    buf_opts
  )

  util.nmap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", buf_opts)
  util.nmap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", buf_opts)

  -- util.nmap("<leader>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end, { expr = true, noremap = true, silent = true })
  util.nmap("<leader>rn", "<cmd>Lspsaga rename<CR>", buf_opts)
  util.nmap("<leader>o", "<cmd>SymbolsOutline<CR>", { noremap = true, silent = true })
  util.nmap("<F1>", vim.lsp.buf.signature_help, { noremap = true, silent = true })

  -- util.nmap('gd', vim.lsp.buf.definition, buf_opts)
  -- util.nmap('gi', vim.lsp.buf.implementation, buf_opts)
  -- util.nmap('K', vim.lsp.buf.signature_help, buf_opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  on_attach = on_attach,
  capabilities = capabilities
}
