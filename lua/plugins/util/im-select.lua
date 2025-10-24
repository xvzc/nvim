if vim.loop.os_uname().sysname == "Darwin" then
  return {
    "keaising/im-select.nvim",
    event = "VeryLazy",
    config = true,
    opts = {
      default_command = "im-select",
      default_im_select = "com.apple.keylayout.ABC",
      disable_auto_restore = 0,
      set_previous_events = {},
    },
  }
else
  return {}
end
