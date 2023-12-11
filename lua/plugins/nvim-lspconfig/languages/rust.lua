local lspconfig = require("lspconfig")
local common = require("plugins.nvim-lspconfig.common")
local lsp_util = require("lspconfig/util")

local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = common.on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
        completion = { autocomplete = true }

      },
    },
  },
}

-- lspconfig.rust_analyzer.setup {
--   on_attach = common.on_attach,
--   capabilities = common.capabilities,
--   filetyps = { "rust" },
--   root_dir = lsp_util.root_pattern("Cargo.toml"),
--   settings = {
--     ["rust-analyzer"] = {
--       enabled = true,
--       diagnostics = {
--         enable = false,
--       },
--       cargo = {
--         allFeatures = true,
--       },
--     },
--   }
-- }

local rt = require("rust-tools")

rt.setup(opts)
