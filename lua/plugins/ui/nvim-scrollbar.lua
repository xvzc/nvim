-- return {
-- "petertriho/nvim-scrollbar",
-- opts = {
--   handle = {
--     text = " ",
--     blend = 70,
--     color = "#ffffff",
--     -- color_nr = "#ffffff", -- cterm
--     -- highlight = "Normal",
--     hide_if_all_visible = true, -- Hides handle if all lines are visible
--   },
--   handlers = {
--     gitsigns = true,
--   },
--   marks = {
--     Cursor = {
--       text = " ",
--       priority = 0,
--       gui = nil,
--       color = nil,
--       cterm = nil,
--       color_nr = nil, -- cterm
--       highlight = "Normal",
--     },
--   },
-- },
-- }

return {
  "lewis6991/satellite.nvim",
  opts = {
    handlers = {
      cursor = {
        enable = false,
        -- Supports any number of symbols
        -- symbols = { '⎻', '⎼' }
        -- Highlights:
        -- - SatelliteCursor (default links to NonText
      },
      gitsigns = {
        enable = true,
        signs = { -- can only be a single character (multibyte is okay)
          add = "-",
          change = "-",
          delete = "-",
        },
        -- Highlights:
        -- SatelliteGitSignsAdd (default links to GitSignsAdd)
        -- SatelliteGitSignsChange (default links to GitSignsChange)
        -- SatelliteGitSignsDelete (default links to GitSignsDelete)
      },
    },
  },
}
