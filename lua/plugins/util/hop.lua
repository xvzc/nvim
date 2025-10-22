local keys = {
  {
    mode = { "n" },
    "<leader>f",
    function()
      require("hop").hint_char1()
    end,
    { silent = true, noremap = true },
  },
  {
    mode = { "n" },
    "<leader><leader>f",
    function()
      require("hop").hint_char2()
    end,
    { silent = true, noremap = true },
  },
}

return {
  "phaazon/hop.nvim",
  event = "VeryLazy",
  keys = keys,
  opts = {
    keys = "hklyuiopnmqwertzxcvbasdgjf",
    teasing = false,
  },
}
