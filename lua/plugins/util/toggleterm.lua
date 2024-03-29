require("toggleterm").setup({
	function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<F12>]],
	hide_numbers = true,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	highlights = {
		-- Normal = {
		--   guibg = "1E2659",
		-- },
		-- NormalFloat = {
		--   link = '1E2659'
		-- },
		-- FloatBorder = {
		--   guifg = "<VALUE-HERE>",
		--   guibg = "<VALUE-HERE>",
		-- },
	},

	float_opts = {
		border = "single",
		width = 130,
		height = 45,
	},
})
