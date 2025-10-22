return {
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        flake8 = {
          ignore = { "E203" },
          enabled = true,
        },
      },
    },
  },
}
