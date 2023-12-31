if vim.loop.os_uname().sysname == 'Darwin' then
  require('im_select').setup {
    default_im_select    = "com.apple.keylayout.ABC",
    disable_auto_restore = 0,
    set_previous_events  = {},
  }
end

