local function config()
  -- local highlight = {
  --   "CursorColumn",
  --   "Whitespace",
  -- }
  --
  -- local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
  vim.api.nvim_set_hl(0, "CustomIndentColor", { fg = "#33333d" })
  -- vim.api.nvim_set_hl(0, "CustomSpaceColor", { fg = normal.bg })

  require("ibl").setup({
    whitespace = {
      highlight = "CustomIndentColor",
      remove_blankline_trail = false,
    },
    indent = {
      char = "┊",
      tab_char = nil,
      highlight = "CustomIndentColor",
      smart_indent_cap = true,
      priority = 1,
      repeat_linebreak = true,
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "dashboard",
        "lspinfo",
        "packer",
        "checkhealth",
        "help",
        "man",
        "gitcommit",
        "TelescopePrompt",
        "TelescopeResults",
        "",
      },
    },
  })
end

return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = true,
  main = "ibl",
  config = config,
}
