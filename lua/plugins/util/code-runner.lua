local neoconf = require("neoconf")
local code_runner = require("code_runner")

vim.cmd([[
hi CodeRunner guifg=#D0C8C8 guibg=#1C2219
hi CodeRunnerBorder guifg=#949693 guibg=#1C2219
]])

local filetype = {
	typescript = "yarn run ts-node",
	rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
	cpp = function()
		if string.find(vim.api.nvim_buf_get_name(0), "/algorithms/boj") then
			return "boj run $end"
		end

		local workspace = require("neoconf.workspace").get()
		local project = neoconf.get("project", nil, {
			file = "Makefile",
		})

		local command = {
			"cd " .. workspace.root_dir .. " &&",
			project.compile.all .. " &&",
			workspace.root_dir .. "/" .. project.target .. " &&",
			project.clean .. " $end",
		}
		return table.concat(command, " ")
	end,
	boj = "boj submit $end",
	python = { "python3" },
	zsh = "zsh",
	sh = "bash",
	terraform = "terraform plan $end",
	go = "go run ./...",
}

local ok, project = pcall(require, "project")
if not ok then
	project = {}
end

code_runner.setup({
	mode = "term",
	float = {
		border = "solid",
		float_hl = "CodeRunner",
		border_hl = "CodeRunnerBorder",
	},
	-- choose default mode (valid term, tab, float, toggle, buf)
	-- mode = "term",
	focus = true,
	startinsert = true,
	term = {
		position = "bot",
		size = 25,
	},
	filetype_path = "",
	project_path = "",
	filetype = filetype,
	project = project,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { os.getenv("HOME") .. "/_personal/algorithms/boj/problems/*" },
	callback = function()
		vim.keymap.set("n", "<C-M-s>", ":w<CR>:RunCode boj<CR>", { silent = true })
	end,
})

vim.keymap.set("n", "<C-M-r>", ":w<CR>:RunCode<CR>", { silent = true })
