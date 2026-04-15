vim.api.nvim_create_autocmd("CursorMoved", {
  group = vim.api.nvim_create_augroup("auto-hlsearch", { clear = true }),
  callback = function()
    if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
      vim.schedule(function()
        vim.cmd.nohlsearch()
      end)
    end
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("DiffAutoResize", { clear = true }),
  callback = function()
    if vim.wo.diff then
      vim.cmd("wincmd =")
    end
  end,
})
