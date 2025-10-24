-- return {
--   "petertriho/nvim-scrollbar",
--   enabled = true,
--   dependencies = {
--     "kevinhwang91/nvim-hlslens",
--   },
--   opts = {
--     handle = {
--       text = " ",
--       blend = 10,
--       color = nil,
--       color_nr = nil, -- cterm
--       highlight = "CursorColumn",
--       hide_if_all_visible = true, -- Hides handle if all lines are visible
--     },
--     handlers = {
--       gitsigns = true,
--     },
--     marks = {
--       Cursor = {
--         text = "•",
--         priority = 0,
--         gui = nil,
--         color = nil,
--         cterm = nil,
--         color_nr = nil, -- cterm
--         highlight = "Normal",
--       },
--     },
--   },
-- }

return {
  "dstein64/nvim-scrollview",
  opts = {},
}
