local function config()
  vim.api.nvim_set_hl(0, "CustomIndentColor", { fg = "#3A3D35" })
  vim.api.nvim_set_hl(0, "CustomScopeColor", { fg = "#927694" })

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
    scope = {
      enabled = true,
      highlight = "CustomScopeColor",
      show_start = false,
      show_end = false,
      show_exact_scope = true,
      include = {},
    },

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
  enabled = false,
  main = "ibl",
  config = config,
}
