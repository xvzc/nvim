local common = require("plugins.nvim-cmp.common")
local cmp = require("cmp")

local mapping = cmp.mapping.preset.insert({
  ['<C-e>'] = cmp.mapping.scroll_docs(-2),
  ['<C-y>'] = cmp.mapping.scroll_docs(2),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<Tab>'] = cmp.mapping({
    i = function(fallback)
      if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        fallback()
      elseif cmp.visible() then
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
      else
        fallback()
      end
    end,
  }),
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
})

return mapping
