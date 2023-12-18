require("chezmoi").setup({
  edit = {
    watch = true,
    force = true,
  },
  notification = {
    on_open = true,
    on_save = true
  },
})
