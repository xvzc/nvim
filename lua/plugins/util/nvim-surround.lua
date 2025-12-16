local function config()
  require("nvim-surround").setup({})

  vim.keymap.set({ "n" }, "s", "ysiw", { silent = true, remap = true })
  vim.keymap.set("x", "s", "S", { silent = true, remap = true })
end

return {
  "kylechui/nvim-surround",
  version = "^3.0.0",
  event = "VeryLazy",
  config = config,
}
