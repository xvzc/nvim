local header = {
  "",
  "",
  "",
  "",
  " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  "",
}

local center = {
  {
    icon = "  ",
    desc = "Recently Opened Files ",
    action = "lua require('telescope.builtin').oldfiles()",
  },
  {
    icon = "  ",
    desc = "Current Directory     ",
    action = "lua require('telescope.builtin').find_files()",
  },
  {
    icon = "  ",
    desc = "Configs               ",
    action = "lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim'} )",
  },
}

return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  opts = {
    theme = "doom", --  theme is doom and hyper default is hyper
    config = {
      header = header,
      center = center,
    },
  },
}
