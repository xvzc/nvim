local profile = require("profile")

if profile.osid == 'mac' then
  require('im_select').setup {
    default_im_select    = "com.apple.keylayout.ABC",
    disable_auto_restore = 0,
    set_previous_events  = {},
  }
end
