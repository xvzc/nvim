local dropdown = function(opts)
    opts = opts or {}

  local theme_opts = {
    theme = "dropdown",

    results_title = false,

    sorting_strategy = "ascending",
    layout_strategy = "center",
    layout_config = {
      preview_cutoff = 1, -- Preview should always show (unless previewer = false)

      width = function(_, max_columns, _)
        return math.min(max_columns, 80)
      end,

      height = function(_, _, max_lines)
        return math.min(max_lines, 15)
      end,
    },

    border = true,
    borderchars = {
      prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
  }
  if opts.layout_config and opts.layout_config.prompt_position == "bottom" then
    theme_opts.borderchars = {
      prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      results = { "─", "│", "─", "│", "┌", "┐", "┤", "├" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

    }
  end

  return vim.tbl_deep_extend("force", theme_opts, opts)
end


local bottom_pane = function(opts)
  opts = opts or {}

  local theme_opts = {
    theme = "ivy",

  prompt_prefix = '🔍 ',
    sorting_strategy = "ascending",

    layout_strategy = "bottom_pane",
    layout_config = {
      height = 25,
    },

    border = true,
    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
  }
  if opts.layout_config and opts.layout_config.prompt_position == "bottom" then
    theme_opts.borderchars = {
      prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    }
  end

  return vim.tbl_deep_extend("force", theme_opts, opts)
end

return {
  theme = {
    bottom_pane = bottom_pane,
    dropdown = dropdown
  }
}
