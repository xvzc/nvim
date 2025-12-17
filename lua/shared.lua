local M = {}

M.get_dynamic_float_size = function(w_ratio, h_ratio)
  local screen_w = vim.opt.columns:get()
  local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
  local window_w = screen_w * w_ratio
  local window_h = screen_h * h_ratio
  local window_w_int = math.floor(window_w)
  local window_h_int = math.floor(window_h)
  local center_x = (screen_w - window_w) / 2
  local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

  return {
    row = center_y,
    col = center_x,
    width = window_w_int,
    height = window_h_int,
  }
end

M.get_bold_square_borders = function()
  return { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }
end

return M
