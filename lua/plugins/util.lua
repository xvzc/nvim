return {
  {
    "xvzc/chezmoi.nvim",
    dir = "~/personal/chezmoi.nvim",
    event = "BufReadPre",
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
        callback = function()
          vim.schedule(require("chezmoi.commands.__edit").watch)
        end,
      })
    end,
    opts = {
      extra_args = {
        "--no-tty",
      },
      edit = {
        watch = false,
        force = false,
      },
      events = {
        on_open = {
          notification = {
            enable = false,
          },
        },
        on_watch = {
          notification = {
            enable = true,
          },
        },
        on_apply = {
          notification = {
            enable = true,
          },
        },
      },
      telescope = {
        select = { "<CR>" },
      },
    },
  },
  {
    "keaising/im-select.nvim",
    enabled = false,
    cond = vim.loop.os_uname().sysname == "Darwin",
    event = "VeryLazy",
    config = true,
    opts = {
      default_command = "im-select",
      default_im_select = "com.apple.keylayout.ABC",
      disable_auto_restore = 0,
      set_previous_events = {},
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = {
          insert_mode = true,
        },
        use_absolute_path = true,
      },
    },
  },
  {
    "xvzc/skeleton.nvim",
    opts = {
      template_path = vim.fn.stdpath("config") .. "/templates",
      patterns = {
        cpp = { "*" },
      },
      tags = {
        author = "xvzc",
      },
    },
  },
  {
    "farmergreg/vim-lastplace",
    enabled = true,
    init = function()
      vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
      vim.g.lastplace_ignore_buftype = "quickfix,nofile,help"
      vim.g.lastplace_open_folds = 0
    end,
  },
  {
    "xvzc/cbox.nvim",
    enabled = true,
    event = "VeryLazy",
    -- dir = "~/personal/cbox.nvim",
    keys = {
      {
        mode = { "n", "x" },
        "gb",
        function()
          require("cbox").toggle({ theme = "thin", visual_line = { style = "line" } })
        end,
        { silent = true },
      },
      {
        mode = { "n", "x" },
        "gB",
        function()
          require("cbox").toggle({ theme = "bold", visual_line = { style = "line" } })
        end,
        { silent = true },
      },
    },
  },
}
