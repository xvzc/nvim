local Job = require("plenary.job")

local common = {}

function common.pgrep_sync(name)
	local ports = Job:new({
		command = "pgrep",
		args = { name },
		on_stderr = function(error, _)
			error(error)
		end,
	}):sync()

	if #ports > 0 then
		return ports[1]
	end

	return nil
end

function common.new_port()
	local tcp = vim.uv.new_tcp()
	tcp:bind("127.0.0.1", 0)

	local port = tcp:getsockname().port

	tcp:shutdown()
	tcp:close()

	return port
end

function common.run_server(cmd, args)
	local stdout = vim.loop.new_pipe(false)
	local stderr = vim.loop.new_pipe(false)
	local opts = {
		stdio = { nil, stdout, stderr },
		args = args,
	}

	local handle
	local pid_or_err
	handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
		stdout:close()
		stderr:close()
		handle:close()
		if code ~= 0 then
			print("codelldb exited with code", code)
		end
	end)

	if not handle then
		vim.notify("Error running codelldb: " .. tostring(pid_or_err), vim.log.levels.ERROR)
		stdout:close()
		stderr:close()
		return
	end

	vim.notify("codelldb started. pid=" .. pid_or_err)
	stderr:read_start(function(err, chunk)
		assert(not err, err)
		if chunk then
			vim.schedule(function()
				require("dap.repl").append(chunk)
			end)
		end
	end)
end

return common
