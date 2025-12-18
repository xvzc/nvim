vim.keymap.set("n", "<leader>e", function()
  if vim.bo.filetype == "oil" then
    require("oil").close()
    return
  end

  require("nvim-tree.api").tree.toggle()
end, { silent = true, noremap = true })

return {
  "nvim-tree/nvim-tree.lua",
  enabled = true,
  -- dir = "~/personal/nvim-tree.lua",
  event = "VeryLazy",
  opts = {
    view = {
      -- width = 38,
      float = {
        enable = true,
        quit_on_focus_loss = true,
        open_win_config = function()
          local shared = require("shared")
          local info = shared.get_dynamic_float_size(0.7, 0.8, 70, 35)
          return {
            border = shared.get_bold_square_borders(),
            relative = "editor",
            row = info.row,
            col = info.col,
            width = info.width,
            height = info.height,
          }
        end,
      },
    },
    git = {
      show_on_dirs = true,
    },
    renderer = {
      highlight_git = "name",
      icons = {
        git_placement = "right_align",
        glyphs = {
          git = {
            unstaged = "*",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "?",
            deleted = "-",
            ignored = "◌",
          },
        },
      },
    },
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      -- untracked files highlight
      vim.api.nvim_set_hl(0, "NvimTreeGitNewIcon", { fg = "#c7a8fc" })
      vim.api.nvim_set_hl(0, "NvimTreeGitStagedIcon", { fg = "#9fe09d" })

      vim.keymap.set("n", "q", api.tree.close, opts("close"))
      vim.keymap.set("n", "a", api.node.open.edit, opts("open_or_edit"))
      vim.keymap.set("n", "r", api.tree.reload, opts("reload"))
      vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("toggle_hidden"))

      vim.keymap.set("n", "<BS>", api.tree.change_root_to_parent, opts("navigate_up"))
      vim.keymap.set(
        "n",
        ".",
        api.tree.change_root_to_node,
        opts("change_root_to_node")
      )
      vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
    end,
  },
}
