local osc52 = require("vim.ui.clipboard.osc52")

local is_tmux = vim.env.TMUX ~= nil and vim.env.TMUX ~= ""
local is_ssh = vim.env.SSH ~= nil and vim.env.SSH ~= ""

vim.g.clipboard = {
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },

  paste = {
    ["+"] = osc52.paste("+"),
    ["*"] = osc52.paste("*"),
  },
}

local is_darwin = vim.fn.has("macunix")
vim.g.clipboard = {
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },
  paste = {
    ["+"] = is_darwin and "pbpaste" or "xclip -o -selection clipboard",
    ["*"] = is_darwin and "pbpaste" or "xclip -o -selection clipboard",
  },
}
