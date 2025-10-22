vim.opt.list = true
vim.opt.listchars:append("space:⋅")

return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = true,
  main = "ibl",
  opts = {
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
  },
}
