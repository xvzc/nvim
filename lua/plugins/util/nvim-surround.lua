-- vim.keymap.del("s", "s", { silent = true, remap = true })

local keys = {
  { mode = { "n" }, "s", "ysiw", { silent = true, remap = true } },
  { mode = { "v" }, "s", "S", { silent = true, remap = true } },
}

return {
  "kylechui/nvim-surround",
  keys = keys,
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
}
