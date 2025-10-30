local function config()
  local cmp = require("cmp")
  local util = require("plugins.code.nvim-cmp.modules.util")
  local mapping = require("plugins.code.nvim-cmp.modules.mapping")
  cmp.setup({
    preselect = cmp.PreselectMode.None,
    mapping = mapping.global,
    expand = function(args)
      (vim.snippet ~= nil and vim.snippet.expand or vim.fn["UltiSnips#Anon"])(
        args.body
      )
    end,
    -- expand = function(args)
    --   require("luasnip").lsp_expand(args.body)
    -- end,
    enabled = util.should_enable,
    formatting = {
      fields = { "abbr", "kind" },
      format = util.format_item,
    },
    sources = cmp.config.sources({
      { name = "ultisnips", priority = 1000 },
      -- { name = "luasnip", priority = 1000 },
      {
        priority = 999,
        name = "nvim_lsp",
        entry_filter = function(entry, _)
          local kind =
            require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
          if vim.tbl_contains({ "Text" }, kind) then
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
    mapping = mapping.cmdline,
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    mapping = mapping.cmdline,
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

  require("plugins.code.nvim-cmp.modules.style").apply_style()
end

return {
  "hrsh7th/nvim-cmp",
  config = config,
  event = "VeryLazy",
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
    -- { "saadparwaiz1/cmp_luasnip" },
    {
      "quangnguyen30192/cmp-nvim-ultisnips",
      config = true,
    },
  },
}
