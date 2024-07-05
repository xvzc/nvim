local toggleterm = require("toggleterm")

require("chezmoi").setup({
  edit = {
    watch = true,
    force = true,
    after = function()end

  },
  notification = {
    on_open = false,
    on_watch = true,
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
