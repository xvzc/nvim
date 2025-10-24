local function config()
  vim.lsp.config("*", {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        },
      },
    },
  })

  vim.lsp.enable("clangd")
  vim.lsp.enable("gopls")
  vim.lsp.enable("golangci_lint_ls")
  vim.lsp.enable("jsonls")
  vim.lsp.enable("lua_ls")
  vim.lsp.enable("mdx_analyzer")
  vim.lsp.enable("nixd")
  vim.lsp.enable("pylsp")
  vim.lsp.enable("rust_analyzer")
  vim.lsp.enable("bashls")
  vim.lsp.enable("terraformls")
  vim.lsp.enable("tflint")
  vim.lsp.enable("ts_ls")

  vim.lsp.handlers["client/registerCapability"] = (function(overridden)
    return function(err, res, ctx)
      local result = overridden(err, res, ctx)
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      if not client then
        return
      end
      for bufnr, _ in pairs(client.attached_buffers) do
        -- CUSTOM on_attach
        -- client.server_capabilities.semanticTokensProvider = nil
        if client.server_capabilities.document_highlight then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            callback = function()
              vim.lsp.buf.document_highlight()
            end,
            buffer = 0,
          })
        end
      end
      return result
    end
  end)(vim.lsp.handlers["client/registerCapability"])

  local border = {
    { "┌", "FloatBorder" },
    { "─", "FloatBorder" },
    { "┐", "FloatBorder" },
    { "│", "FloatBorder" },
    { "┘", "FloatBorder" },
    { "─", "FloatBorder" },
    { "└", "FloatBorder" },
    { "│", "FloatBorder" },
  }

  local handlers = vim.lsp.handlers

  handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = border,
  })

  handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = border,
    })

  handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      update_in_insert = false,
    })

  vim.diagnostic.config({
    float = {
      focusable = false,
      source = true,
      border = "rounded",
      header = "",
      prefix = "",
    },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "󰅚",
        [vim.diagnostic.severity.WARN] = "󰀪",
        [vim.diagnostic.severity.HINT] = "",
        [vim.diagnostic.severity.INFO] = "",
      },
    },
    virtual_text = false,
    severity_sort = true,
    update_in_insert = false,
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      local opts = { buffer = ev.buf }

      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      vim.api.nvim_create_autocmd({ "CursorMoved" }, {
        callback = function()
          vim.lsp.buf.clear_references()
        end,
        buffer = 0,
      })

      vim.keymap.set("n", "gd", "<cmd>Lspsaga finder def<CR>", opts)
      vim.keymap.set("n", "gr", "<cmd>Lspsaga finder ref<CR>", opts)
      vim.keymap.set("n", "gi", "<cmd>Lspsaga finder imp<CR>", opts)

      vim.keymap.set("n", "<leader>c", function()
        require("lspsaga.codeaction"):code_action()
      end, opts)
      vim.keymap.set(
        "n",
        "<leader>i",
        "<cmd>Lspsaga show_cursor_diagnostics ++unfocus<CR>",
        opts
      )
      vim.keymap.set(
        "n",
        "<leader>I",
        "<cmd>Lspsaga show_workspace_diagnostics ++focus<CR>",
        opts
      )

      vim.keymap.set(
        "n",
        "<leader>[",
        "<cmd>Lspsaga diagnostic_jump_prev<CR>",
        opts
      )
      vim.keymap.set(
        "n",
        "<leader>]",
        "<cmd>Lspsaga diagnostic_jump_next<CR>",
        opts
      )

      vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
      vim.keymap.set(
        "n",
        "<F1>",
        vim.lsp.buf.signature_help,
        { noremap = true, silent = true }
      )
    end,
  })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  dependencies = {
    require("plugins.code.lspconfig.deps.lspsaga"),
    require("plugins.code.lspconfig.deps.outline"),
    -- { 'simrat39/rust-tools.nvim',     ft = { 'rust' } },
    { "yuezk/vim-js", ft = { "js" } },
    { "othree/yajs.vim", ft = { "js" } },
    { "HerringtonDarkholme/yats.vim", ft = { "js" } },
    { "maxmellon/vim-jsx-pretty", ft = { "jsx" } },
    { "hashivim/vim-terraform", ft = { "tf", "terraform" } },
  },
}
