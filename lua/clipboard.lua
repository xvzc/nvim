-- if vim.loop.os_uname().sysname == "Linux" then
--   local clipboard = {}
--
--   clipboard['name'] = 'xclip-xfce4-clipman'
--
--   clipboard['copy'] = {}
--   clipboard['copy']['+'] = 'xclip -selection clipboard'
--   clipboard['copy']['*'] = 'xclip -selection clipboard'
--
--   clipboard['paste'] = {}
--   clipboard['paste']['+'] = 'xclip -selection clipboard -o'
--   clipboard['paste']['*'] = 'xclip -selection clipboard -o'
--
--   clipboard['cache_enabled'] = 1
--
--   vim.g.clipboard = clipboard
-- end
-- vim.g.clipboard.name =
-- vim.g.clipboard.copy["+"] = osc52.copy("+")
-- vim.g.clipboard.copy["*"] = osc52.copy("*")

local osc52 = require("vim.ui.clipboard.osc52")

vim.g.clipboard = {
	name = "OSC-52",
	copy = {
		["+"] = osc52.copy("+"),
		["*"] = osc52.copy("*"),
	},
	paste = {
		["+"] = osc52.paste("+"),
		["*"] = osc52.paste("*"),
	},
}
