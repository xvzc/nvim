require("nvim-surround").setup {
}

vim.keymap.set('n', 's', 'ysiw', { silent = true, remap = true })
vim.keymap.set('v', 's', 'S', {silent = true, remap = true})
