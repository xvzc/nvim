local silent_noremap = { silent = true, noremap = true }
local silent_noremap_expr = { silent = true, noremap = true, expr = true }

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>-", ":sp<CR><C-w>j", silent_noremap)
vim.keymap.set("n", "<leader>_", ":vsp<CR><C-w>l", silent_noremap)

-- vim.keymap.set("n", "<leader>h", "<C-w>h", silent_noremap)
-- vim.keymap.set("n", "<leader>j", "<C-w>j", silent_noremap)
-- vim.keymap.set("n", "<leader>k", "<C-w>k", silent_noremap)
-- vim.keymap.set("n", "<leader>l", "<C-w>l", silent_noremap)

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', silent_noremap)

vim.keymap.set({ "n", "v" }, "<leader>d", '"+d', silent_noremap)
vim.keymap.set("n", "<leader>D", '"+D', silent_noremap)

vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', silent_noremap)

vim.keymap.set("n", "<F5>", "<C-l>", silent_noremap)
vim.keymap.set("x", "A", "gg^oG$", silent_noremap)

-- diagnostics
vim.keymap.set(
  "n",
  "[d",
  vim.diagnostic.goto_prev,
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "]d",
  vim.diagnostic.goto_next,
  { noremap = true, silent = true }
)

vim.keymap.set("n", "<C-a>", "<nop>")
vim.keymap.set("n", "q:", "<nop>")

--
-- -- open file
-- vim.keymap.set("n", "<F5>", function()
--   if vim.api.nvim_get_vvar("hlsearch") == 1 then
--     return ":nohl<CR><esc>"
--   end
--
--   for _, wid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
--     if vim.api.nvim_win_get_config(wid).zindex then
--       return ":fclose!<CR><esc>"
--     end
--   end
--
--   return "<esc>"
-- end, silent_noremap_expr)

vim.keymap.set("n", "<S-F5>", function()
  vim.notify("Reload neovim config")
  vim.cmd([[:source ~/.config/nvim/init.lua]])
end, { silent = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "**/algorithm/boj/*" },
  callback = function()
    vim.keymap.set("n", "<C-M-s>", ":!boj submit", silent_noremap)
  end,
})
