local cmp = require("cmp")
local common = require("plugins.code.nvim-cmp.common")

local function format_item(entry, vim_item)
	vim_item.kind = common.kind_icons[vim_item.kind]

	-- This concatonates the icons with the name of the item kind
	local MAX_LABEL_LENGTH = 20
	local label = vim.trim(vim_item.abbr)
	if string.len(label) > MAX_LABEL_LENGTH then
		label = vim.fn.strcharpart(label, 0, MAX_LABEL_LENGTH) .. ".."
	end

	vim_item.abbr = label

	if entry.source.name == "nvim_lsp" then
		vim_item.abbr = "•" .. vim_item.abbr
	end

	-- Source
	vim_item.menu = ({
		buffer = "[BUF]",
		nvim_lsp = "[LSP]",
		ultisnips = "[SNI]",
		latex_symbols = "[LTX]",
	})[entry.source.name]

	return vim_item
end

cmp.setup({
	preselect = cmp.PreselectMode.None,
	mapping = require("plugins.code.nvim-cmp.mapping"),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = format_item,
	},
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	sources = cmp.config.sources({
		{ name = "ultisnips", priority = 1000 }, -- For ultisnips users.
		{
			priority = 999,
			name = "nvim_lsp",
			entry_filter = function(entry, _)
				local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
				if kind == "Text" then
					return false
				end
				return true
			end,
		},
		{ name = "buffer", 998 },
		{ name = "path", 997 },
	}),
	experimental = {
		ghost_text = false,
	},
})

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
