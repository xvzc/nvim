require("neodev").setup({
	-- Always add neovim plugins into lua_ls library, even if not neovim config
	override = function(root_dir, library)
		library.enabled = false
		library.plugins = false
		library.types = true
	end,
	pathStrict = false,
})
