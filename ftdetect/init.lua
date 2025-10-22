-- no comment when adding a new line from a commented line
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

vim.filetype.add({
  pattern = {
    ["*/etc/nginx/*"] = "nginx",
    ["*/usr/local/nginx/conf/*"] = "nginx",
    ["nginx.conf"] = "nginx",
    ["*.nginx"] = "nginx",
  },
})

vim.filetype.add({
  pattern = {
    ["Dockerfile.*"] = "dockerfile",
  },
})

vim.filetype.add({
  pattern = {
    ["*.snippets"] = "snippets",
  },
})

vim.filetype.add({
  pattern = {
    ["*/.ssh/config.d/*"] = "sshconfig",
  },
})

