local neoconf = require("neoconf")
local code_runner = require("code_runner")

vim.cmd([[
hi CodeRunner guifg=#D0C8C8 guibg=#1C2219
hi CodeRunnerBorder guifg=#949693 guibg=#1C2219
]])

local is_boj = function()
	return string.find(vim.api.nvim_buf_get_name(0), "/algorithms/boj")
end

local filetype = {
	typescript = "yarn run ts-node",
	rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
	cpp = function()
		if is_boj() then
			return "boj run $end"
		end

		local command = {
			"cd $dir &&",
			"g++ -std=c++20 -O2 -Wall -Wno-sign-compare $fileName -o $dir/a.out &&",
			"$dir/a.out &&",
			"rm -rf $dir/a.out",
		}
		return table.concat(command, " ")
	end,
	boj_submit = "boj submit $end",
	python = function()
		if is_boj() then
			return "boj run $end"
		end

    return "python3"
  end,
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
		vim.keymap.set("n", "<C-M-s>", ":w<CR>:RunCode boj_submit<CR>", { silent = true })
	end,
})

vim.keymap.set("n", "<C-M-r>", ":w<CR>:RunCode<CR>", { silent = true })
