require('toggleterm').setup {
  function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<F1>]],
  hide_numbers = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,

  float_opts = {
    border = 'single',
    width = 100,
    height = 45,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
