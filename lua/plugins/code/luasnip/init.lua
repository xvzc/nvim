local function config()
  local luasnip = require("luasnip")
  luasnip.setup({})

  -- require("luasnip.loaders.from_snipmate").lazy_load({
  --   paths = { "~/.config/nvim/snippets/" },
  -- })

  local unlinkgrp =
    vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true })

  vim.api.nvim_create_autocmd("ModeChanged", {
    group = unlinkgrp,
    pattern = { "s:n", "i:*" },
    desc = "Forget the current snippet when leaving the insert mode",
    callback = function(evt)
      if
        luasnip.session
        and luasnip.session.current_nodes[evt.buf]
        and not luasnip.session.jump_active
      then
        luasnip.unlink_current()
      end
    end,
  })

  require("luasnip.loaders.from_vscode").lazy_load()
  luasnip.add_snippets("all", require("plugins.code.luasnip.custom.all"))
end

return {
  "L3MON4D3/LuaSnip",
  enabled = false,
  -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  version = "v2.*",
  build = "make install_jsregexp",
  config = config,
  dependencies = {
    { "rafamadriz/friendly-snippets" },
  },
}
