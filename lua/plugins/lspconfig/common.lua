-- :help vim.lsp.diagnostic.on_publish_diagnostics
local on_attach = function(client, bufnr)
  local buf_opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<C-l>', '<cmd>GuardFmt<CR>', { noremap = true })

  client.server_capabilities.semanticTokensProvider = nil

  if client.server_capabilities.document_highlight then
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
      buffer = 0
    })
  end

  vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
    callback = function()
      vim.lsp.buf.clear_references()
    end,
    buffer = 0
  })

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.keymap.set('n', "<leader>gc", "<cmd>Lspsaga code_action<CR>", buf_opts)
  vim.keymap.set('n', "gd", "<cmd>Lspsaga finder def<CR>", buf_opts)
  vim.keymap.set('n', "gr", "<cmd>Lspsaga finder ref<CR>", buf_opts)
  vim.keymap.set('n', "gi", "<cmd>Lspsaga finder imp<CR>", buf_opts)
  vim.keymap.set('n', 
    "<leader>i",
    "<cmd>Lspsaga show_line_diagnostics ++unfocus<CR>",
    buf_opts
  )

  vim.keymap.set('n', "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", buf_opts)
  vim.keymap.set('n', "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", buf_opts)

  -- vim.keymap.set('n', "<leader>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end, { expr = true, noremap = true, silent = true })
  vim.keymap.set('n', "<leader>rn", "<cmd>Lspsaga rename<CR>", buf_opts)
  vim.keymap.set('n', "<leader>o", "<cmd>SymbolsOutline<CR>", { noremap = true, silent = true })
  vim.keymap.set('n', "<F1>", vim.lsp.buf.signature_help, { noremap = true, silent = true })

  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buf_opts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buf_opts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, buf_opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  on_attach = on_attach,
  capabilities = capabilities
}
