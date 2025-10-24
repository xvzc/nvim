local function config()
  vim.keymap.set({ "n", "x", "o" }, "<leader>f", "<Plug>(leap)")
  vim.keymap.set("n", "<leader><leader>f", "<Plug>(leap-from-window)")
  -- vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#8f8f8f" })
  require("leap").opts.preview = false
  require("leap").opts.safe_labels = ""
  require("leap").opts.on_beacons = function(targets, _, _)
    for _, t in ipairs(targets) do
      -- Overwrite the `offset` value in all beacons.
      -- target.beacon looks like: { <offset>, <extmark_opts> }
      if t.label and t.beacon then
        t.beacon[1] = 0
      end
    end
  end
  vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })

  vim.api.nvim_create_autocmd("User", {
    pattern = "LeapEnter",
    callback = function(event)
      vim.api.nvim_set_hl(0, "LeapLabel", { fg = "#1cff03", bg = "#000000" })

      vim.g.normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
      vim.g.cursorline_hl = vim.api.nvim_get_hl(0, { name = "CursorLine" })

      local leap_dark_hl = { fg = vim.g.normal_hl.fg, bg = "#171f2b" }
      vim.g.leap_dark_hl = leap_dark_hl

      vim.api.nvim_set_hl(0, "Normal", leap_dark_hl)
      vim.api.nvim_set_hl(0, "CursorLine", { bg = leap_dark_hl.bg })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = leap_dark_hl.bg })
      vim.api.nvim_set_hl(0, "CursorLineSign", { bg = leap_dark_hl.bg })
      vim.diagnostic.enable(false)
    end,
  })
  vim.api.nvim_create_autocmd("User", {
    pattern = "LeapLeave",
    callback = function(event)
      vim.api.nvim_set_hl(0, "Normal", vim.g.normal_hl)
      vim.api.nvim_set_hl(0, "CursorLine", vim.g.cursorline_hl)
      vim.api.nvim_set_hl(0, "CursorLineNr", vim.g.cursorline_hl)
      vim.api.nvim_set_hl(0, "CursorLineSign", vim.g.cursorline_hl)
      vim.diagnostic.enable(true)
    end,
  })
end

return {
  "ggandor/leap.nvim",
  event = "VeryLazy",
  config = config,
}
