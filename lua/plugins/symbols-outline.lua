require("symbols-outline").setup {
  position = 'right',
  auto_close = true,
  keymaps = {
    goto_location = "<Cr>",
    close = { "<Esc>", "q" },
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
}

