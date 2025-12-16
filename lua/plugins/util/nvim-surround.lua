local function config()
  require("nvim-surround").setup({})
end

local keys = {
  { mode = { "n" }, "s", "ysiw", silent = true, remap = true },
  { mode = { "x" }, "s", "S", silent = true, remap = true },
}

return {
  "kylechui/nvim-surround",
  version = "^3.0.0",
  keys = keys,
  event = "VeryLazy",
  config = config,
}
