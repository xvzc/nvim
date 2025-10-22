return {
  filetypes = { "c", "cpp" },
  cmd = {
    "clangd",
    "--header-insertion=never",
  },
}
