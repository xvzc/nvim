require("neotest").setup({
	adapters = {
		require("neotest-python")({
			args = { "--log-level", "DEBUG" },
			runner = "pytest",
		}),
	},
})
