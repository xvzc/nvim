local cmp = require("cmp")
local luasnip = require("luasnip")

local M = {}

M.global = {
  ["<C-e>"] = cmp.mapping(function(fallback)
    if cmp.visible_docs() then
      cmp.mapping.scroll_docs(-2)
    else
      fallback()
    end
  end, { "i" }),
  ["<C-y>"] = cmp.mapping(function(fallback)
    if cmp.visible_docs() then
      cmp.mapping.scroll_docs(2)
    elseif cmp.visible() then
      cmp.confirm()
    else
      fallback()
    end
  end, { "i" }),
  ["<C-n>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
  end, { "i" }),
  ["<C-p>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end, { "i" }),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() and not luasnip.locally_jumpable(1) then
      cmp.confirm({ select = true })
    elseif luasnip.locally_jumpable(1) then
      luasnip.jump(1)
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if luasnip.locally_jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<CR>"] = cmp.mapping.confirm({ select = true }),
  ["<C-d>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.abort()
    else
      fallback()
    end
  end, { "i" }),
}

M.cmdline = {
  ["<Tab>"] = {
    c = function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      end
    end,
  },
  ["<C-n>"] = {
    c = function(fallback)
      if cmp.visible() then
        if #cmp.get_entries() == 1 then
          cmp.confirm({ select = true })
        else
          cmp.select_next_item()
        end
      end
    end,
  },
  ["<C-p>"] = {
    c = function(fallback)
      if cmp.visible() then
        if #cmp.get_entries() == 1 then
          cmp.confirm({ select = true })
        else
          cmp.select_prev_item()
        end
      end
    end,
  },
  ["<C-j>"] = {
    c = function(fallback)
      local key = vim.api.nvim_replace_termcodes("<Down>", true, false, true)
      vim.api.nvim_feedkeys(key, "n", false)
    end,
  },
  ["<C-k>"] = {
    c = function(fallback)
      local key = vim.api.nvim_replace_termcodes("<Up>", true, false, true)
      vim.api.nvim_feedkeys(key, "n", false)
    end,
  },
}

return M
