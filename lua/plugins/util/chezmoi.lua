require("chezmoi").setup({
  edit = {
    watch = true,
    force = true,
  },
  events = {
    on_open = {
      notification = {
        enable = false,
      },
    },
    on_watch = {
      notification = {
        enable = true,
      },
    },
    on_apply = {
      notification = {
        enable = true,
      },
    },
  },
  telescope = {
    select = { "<CR>" },
  },
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
  callback = function()
    vim.schedule(require("chezmoi.commands.__edit").watch)
  end,
})
