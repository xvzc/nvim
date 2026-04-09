local function config()
  vim.keymap.set({ "n", "x", "o" }, "<leader>f", function()
    require("leap").leap({
      windows = { vim.api.nvim_get_current_win() },
      inclusive = true,
      inputlen = 1,
    })
  end)

  vim.keymap.set({ "n", "x", "o" }, "<leader><leader>f", function()
    require("leap").leap({
      windows = { vim.api.nvim_get_current_win() },
      inclusive = true,
      inputlen = 2,
    })
  end)

  vim.keymap.set({ "n", "x", "o" }, "<leader>g", function()
    local line = vim.fn.line(".")
    -- Skip 3-3 lines around the cursor.
    local top, bot = unpack({ math.max(1, line - 3), line + 3 })
    require("leap").leap({
      -- pattern = "\\v(%<" .. top .. "l|%>" .. bot .. "l)$",
      pattern = "\\v(%<" .. top .. "l|%>" .. bot .. "l)^\\s*\\zs\\S",
      windows = { vim.fn.win_getid() },
      opts = { safe_labels = "" },
    })
  end)

  -- vim.keymap.set("n", "<leader><leader>f", "<Plug>(leap-from-window)")
  -- vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#8f8f8f" })
  require("leap").opts.preview = false
  require("leap").opts.safe_labels = ""
  require("leap").opts.labels = "sfnjklhodweimbuyvrgtaqpcxz"
  require("leap").opts.on_beacons = function(targets, _, _)
    for _, t in ipairs(targets) do
      -- Overwrite the `offset` value in all beacons.
      -- target.beacon looks like: { <offset>, <extmark_opts> }
      if t.label and t.beacon then
        t.beacon[1] = 0
      end
    end
  end
  -- vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
  vim.api.nvim_set_hl(0, "LeapMatch", { link = "None" })
  vim.api.nvim_set_hl(0, "LeapLabel", { fg = "#1cff03", bg = "#000000" })
end

return {
  url = "https://codeberg.org/andyg/leap.nvim",
  -- "ggandor/leap.nvim",
  enable = true,
  event = "VeryLazy",
  config = config,
}
