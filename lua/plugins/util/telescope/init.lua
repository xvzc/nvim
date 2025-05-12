local telescope = require("telescope")
local actions = require("telescope.actions")
local common = require("plugins.util.telescope.common")
local custom = require("plugins.util.telescope.custom")
local builtin = require("telescope.builtin")

local function merge_config(opts)
  opts.defaults = opts.defaults or {}
  opts.theme = opts.theme or {}
  return vim.tbl_deep_extend("force", opts.theme, opts.defaults)
end

local defaults = merge_config({
  theme = common.theme.bottom_pane(),
  defaults = {
    file_ignore_patterns = { "^snippets/" },
    results_title = false,
    preview_title = false,
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    },
  },
})

telescope.setup({
  defaults = defaults,
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

local TelescopeColor = {
  -- TelescopeMatching = { fg = colors.flamingo },
  -- TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

  -- TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
  -- TelescopeResultsTitle = { fg = colors.mantle },
  -- TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
  TelescopePromptBorder = { fg = "#6edb56", bg = "#1f1f28" },
  TelescopeResultsBorder = { fg = "#6edb56", bg = "#1f1f28" },
  TelescopePreviewBorder = { fg = "#6edb56", bg = "#1f1f28" },
  TelescopeResultsNormal = { fg = "#dcd7ba", bg = "#1f1f28" },
  TelescopePreviewNormal = { fg = "#dcd7ba", bg = "#1f1f28" },
  TelescopePromptNormal = { fg = "#dcd7ba", bg = "#1f1f28" },
}

for hl, col in pairs(TelescopeColor) do
  vim.api.nvim_set_hl(0, hl, col)
end

local config_dir = vim.fn.stdpath("config") .. "/lua/plugins/util/telescope/custom"
for _, file in ipairs(vim.fn.readdir(config_dir, [[v:val =~ '\.lua$']])) do
  require("plugins.util.telescope.custom." .. file:gsub("%.lua$", ""))
end

telescope.load_extension("fzf")
telescope.load_extension("skeleton")
telescope.load_extension("chezmoi")
telescope.load_extension("todo-comments")

local silent_noremap = { noremap = true, silent = true }
vim.keymap.set("n", "<C-g>", function()
  custom.command_picker(common.theme.dropdown())
end, silent_noremap)

vim.keymap.set("n", "<leader>b", function()
  builtin.buffers(common.theme.dropdown({
  }))
end, silent_noremap)

vim.keymap.set("n", "<leader>c", function()
  telescope.extensions.chezmoi.find_files()
end, silent_noremap)

-- func = builtin.find_files,
-- opts = {
--   cwd = ,
-- },
