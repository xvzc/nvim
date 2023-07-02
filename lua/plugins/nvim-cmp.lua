local util = require('util')
local cmp = require('cmp')

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local sources = {
  {
    name = 'nvim_lsp',
    entry_filter = function(entry, _)
      local kind = require('cmp.types').lsp.CompletionItemKind[entry:get_kind()]
      if kind == "Text" then return false end
      return true
    end
  },
  { name = 'ultisnips', priority = 1000 }, -- For ultisnips users.
  { name = 'path' },
}

cmp.setup({
  preselect = cmp.PreselectMode.None,
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- print(global.dump(vim_item))

      -- Kind icons
      vim_item.kind = kind_icons[vim_item.kind]

      -- This concatonates the icons with the name of the item kind
      local MAX_LABEL_LENGTH = 20
      local label = util.trim(vim_item.abbr)
      if string.len(label) > MAX_LABEL_LENGTH then
        label = vim.fn.strcharpart(label, 0, MAX_LABEL_LENGTH) .. ".."
      end


      vim_item.abbr = label

      if entry.source.name == 'nvim_lsp' then
        vim_item.abbr = ' •' .. vim_item.abbr
      else
        vim_item.abbr = ' ' .. vim_item.abbr
      end

      -- Source
      vim_item.menu = ({
        buffer = "[BUF]",
        nvim_lsp = "[LSP]",
        ultisnips = "[SNI]",
        latex_symbols = "[LTX]",
      })[entry.source.name]

      return vim_item
    end
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.scroll_docs(-2),
    ['<C-y>'] = cmp.mapping.scroll_docs(2),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        return
      end

      fallback()
      -- available options
      -- vim.call('UltiSnips#CanJumpForwards') == 1
    end, { 'i' }),
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.get_active_entry() then
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace })
      else
        fallback()
      end
    end, { 'i' }),
    ['<C-d>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.abort()
      else
        fallback()
      end
    end, { 'i' }),
  }),
  sources = cmp.config.sources(sources, {
    { name = 'buffer' },
  }),
  experimental = {
    ghost_text = false,
  },
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Events
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- cmp.event:on("menu_opened", function()
--   vim.b.copilot_suggestion_hidden = true
-- end)
--
-- cmp.event:on("menu_closed", function()
--   vim.b.copilot_suggestion_hidden = false
-- end)
