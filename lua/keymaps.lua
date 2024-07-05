local silent_noremap = { silent = true, noremap = true }
local silent_noremap_expr = { silent = true, noremap = true, expr = true }

vim.keymap.set("n", "<leader>-", ":sp<CR><C-w>j", silent_noremap)
vim.keymap.set("n", "<leader>_", ":vsp<CR><C-w>l", silent_noremap)

vim.keymap.set("n", "<leader>h", "<C-w>h", silent_noremap)
vim.keymap.set("n", "<leader>j", "<C-w>j", silent_noremap)
vim.keymap.set("n", "<leader>k", "<C-w>k", silent_noremap)
vim.keymap.set("n", "<leader>l", "<C-w>l", silent_noremap)

vim.keymap.set("n", "<leader>y", '"+y', silent_noremap)
vim.keymap.set("v", "<leader>y", '"+y', silent_noremap)

vim.keymap.set("n", "<leader>d", '"+d', silent_noremap)
vim.keymap.set("v", "<leader>d", '"+d', silent_noremap)
vim.keymap.set("n", "<leader>D", '"+D', silent_noremap)

vim.keymap.set("n", "<leader>p", '"+p', silent_noremap)

vim.keymap.set("n", "<F5>", "<C-l>", silent_noremap)
vim.keymap.set("n", "<leader>a", "gg<S-v><S-g>", silent_noremap)

-- diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })

-- move lines
-- vim.keymap.set('n', '<C-j>', ':m .+1<CR>==', silent_noremap)
-- vim.keymap.set('n', '<C-k>', ':m .-2<CR>==', silent_noremap)
-- vim.keymap.set('v', '<C-j>', "om1om2:m '>+1<CR>`1V`2==`1V`2", silent_noremap)
-- vim.keymap.set('v', '<C-k>', "om1om2:m '<-2<CR>`1V`2==`1V`2", silent_noremap)
-- vim.keymap.set('v', "<C-j>", ":m '>+1<CR>gv", silent_noremap) -- move line up(v)
-- vim.keymap.set('v', "<C-k>", ":m '<-2<CR>gv", silent_noremap) -- move line down(v)

-- open file
vim.keymap.set("n", "<esc>", function()
  if vim.api.nvim_get_vvar("hlsearch") == 1 then
    return ":nohl<CR><esc>"
  end
  return "<esc>"
end, silent_noremap_expr)

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
