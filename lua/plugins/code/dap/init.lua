local dap, dapui = require("dap"), require("dapui")

vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "•", texthl = "DapUIStop", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "•", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "•", texthl = "orange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define("DapStopped", { text = "•", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define(
	"DapLogPoint",
	{ text = "•", texthl = "yellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)

dapui.setup({
	expand_lines = false,
	controls = {
		element = "repl",
		enabled = true,
		icons = {
			disconnect = "",
			pause = "",
			play = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = "",
		},
	},
	force_buffers = true,
	layouts = {
		{
			elements = {
				{
					id = "breakpoints",
					size = 0.25,
				},
				{
					id = "scopes",
					size = 0.375,
				},
				-- {
				-- 	id = "watches",
				-- 	size = 0.25,
				-- },
				{
					id = "stacks",
					size = 0.375,
				},
			},
			position = "right",
			size = 0.4,
		},
		{
			elements = {
				{
					id = "repl",
					size = 0.85,
				},
				{
					id = "console",
					size = 0.25,
				},
			},
			position = "bottom",
			size = 0.25,
		},
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({ reset = true })
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

local config_dir = vim.fn.stdpath("config") .. "/lua/plugins/code/dap/languages"
for _, file in ipairs(vim.fn.readdir(config_dir, [[v:val =~ '\.lua$']])) do
	require("plugins.code.dap.languages." .. file:gsub("%.lua$", ""))
end

vim.keymap.set("n", "<F7>", dap.toggle_breakpoint, { silent = true, noremap = true })
vim.keymap.set("n", "<F8>", dap.continue, { silent = true, noremap = true })
vim.keymap.set("n", "<F10>", function()
	dapui.toggle({ reset = true })
end, { silent = true, noremap = true })
