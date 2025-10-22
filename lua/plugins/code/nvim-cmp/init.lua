local const = require("plugins.code.nvim-cmp.modules.const")

local function format_item(entry, vim_item)
  vim_item.kind = const.kind_icons[vim_item.kind]

  -- This concatonates the icons with the name of the item kind
  local MAX_LABEL_LENGTH = 30
  local label = vim.trim(vim_item.abbr)
  if string.len(label) > MAX_LABEL_LENGTH then
    label = vim.fn.strcharpart(label, 0, MAX_LABEL_LENGTH) .. ".."
  end

  vim_item.abbr = label

  return vim_item
end

local function config()
  local cmp = require("cmp")
  cmp.setup({
    preselect = cmp.PreselectMode.None,
    mapping = require("plugins.code.nvim-cmp.modules.mapping"),
    formatting = {
      fields = { "abbr", "kind" },
      format = format_item,
    },
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    sources = cmp.config.sources({
      { name = "ultisnips", priority = 1000 }, -- For ultisnips users.
      {
        priority = 999,
        name = "nvim_lsp",
        entry_filter = function(entry, _)
          local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
          if kind == "Text" then
            return false
          end
          return true
        end,
      },
      { name = "buffer", 998 },
      { name = "path", 997 },
    }),
    experimental = {
      ghost_text = false,
    },
    window = {
      -- documentation = cmp.config.window.bordered(),
      -- completion = cmp.config.window.bordered(),
    },
  })

  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
      { name = "cmp_git" },
    }, {
      { name = "buffer" },
    }),
  })

  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return {
  "hrsh7th/nvim-cmp",
  config = config,
  -- event = "VeryLazy",
  dependencies = {
    {
      "windwp/nvim-autopairs",
      config = true,
    },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lua" },
    { "lukas-reineke/cmp-under-comparator" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp-document-symbol" },
    {
      "quangnguyen30192/cmp-nvim-ultisnips",
      config = true,
    },
  },
}
