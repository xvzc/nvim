local dap = require("dap")
local workspace = require("neoconf.workspace")

local cmd = vim.fn.stdpath("data") .. "/mason/bin/codelldb"
local common = require("plugins.code.dap.common")

local function program()
	local neoconf = require("neoconf")
	local root_dir = workspace.get().root_dir
	local project = neoconf.get("project", nil, {
		file = "Makefile",
	})

	-- Job:new({
	-- 	command = project.compile.all,
	-- 	args = { "debug" },
	-- 	cwd = root_dir,
	-- 	on_stderr = function(error, _)
	-- 		print(error)
	-- 	end,
	-- }):sync()

	return root_dir .. "/" .. project.target
end

dap.adapters.lldb = function(on_adapter)
	local port = common.new_port()
	common.run_server("codelldb", { "--port", tostring(port), "--multi-session" })

	local adapter = {
		id = "lldb",
		type = "server",
		port = port,
	}

	vim.defer_fn(function()
		on_adapter(adapter)
	end, 500)
end

-- dap.adapters.lldb = {
-- 	id = "lldb",
-- 	type = "server",
-- 	port = "${port}",
-- 	executable = {
-- 		command = cmd,
-- 		args = { "--port", "${port}" },
-- 	},
-- 	detached = true,
-- }

dap.configurations.cpp = {
	{
		type = "lldb",
		request = "launch",
		stopAtEntry = true,
		program = "/Users/kwanghoopark/_personal/algorithms/boj/problems/14500/build/main.out",
		cwd = function()
			return workspace.get().root_dir
		end,
		terminal = "integrated",
	},
}
