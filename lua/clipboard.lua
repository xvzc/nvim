local osc52 = require("vim.ui.clipboard.osc52")

local is_tmux = vim.env.TMUX ~= nil and vim.env.TMUX ~= ""
local is_ssh = vim.env.SSH_TTY ~= nil and vim.env.SSH ~= ""

if is_tmux or is_ssh then
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

  return
end

local is_darwin = (vim.fn.has("macunix") == 1)
vim.g.clipboard = {
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },
  paste = {
    ["+"] = is_darwin and "pbpaste" or "wl-paste",
    ["*"] = is_darwin and "pbpaste" or "wl-paste",
  },
}
