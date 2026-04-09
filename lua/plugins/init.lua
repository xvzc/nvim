local function import_all(opts)
  -- opts.dir
  -- opts.lua_only
  opts = opts or {}
  opts.dir = opts.dir or ""
  opts.lua_only = opts.lua_only or false

  local dir = vim.fn.stdpath("config") .. "/lua/plugins/"
  local prefix = "plugins."
  if opts.dir ~= nil and opts.dir ~= "" then
    dir = dir .. opts.dir .. "/"
    prefix = prefix .. opts.dir .. "."
  end

  local filtered = {}
  for file in vim.fs.dir(dir) do
    if not opts.lua_only and vim.fn.isdirectory(dir .. file) == 1 then
      table.insert(filtered, { import = prefix .. file })
    elseif file:match("%.lua$") then
      local no_ext = file:match("^([^.]+)")
      if no_ext and no_ext ~= "init" then
        table.insert(filtered, { import = prefix .. no_ext })
      end
    end
  end

  return filtered
end

require("lazy").setup({
  spec = {
    {
      performance = {
        cache = {
          enabled = true,
        },
      },
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },

    { import = "plugins.lspconfig" },
    import_all({ lua_only = true }),
    import_all({ lua_only = false, dir = "extras" }),
  },
})

return import_all
