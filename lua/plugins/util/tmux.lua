local keys = {
  {
    mode = { "n" },
    "<C-h>",
    function()
      require("tmux").move_left()
    end,
    { silent = true },
  },
  {
    mode = { "n" },
    "<C-j>",
    function()
      require("tmux").move_bottom()
    end,
    { silent = true },
  },
  {
    mode = { "n" },
    "<C-k>",
    function()
      require("tmux").move_top()
    end,
    { silent = true },
  },
  {
    mode = { "n" },
    "<C-l>",
    function()
      require("tmux").move_right()
    end,
    { silent = true },
  },
}

return {
  "aserowy/tmux.nvim",
  keys = keys,
  config = true,
}
