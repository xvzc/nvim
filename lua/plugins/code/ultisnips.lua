local function config()
  vim.g.UltiSnipsExpandTrigger = "<C-F19>"
  vim.g.UltiSnipsJumpForwardTrigger = "<C-F19>"
  vim.g.UltiSnipsJumpBackwardTrigger = "<C-F19>"
  --
  -- vim.g.UltiSnipsEnableSnipMate = 1
  vim.g.UltiSnipsEditSplit = "vertical"
  -- vim.g.UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.config/nvim/snippets/"

  vim.cmd([[
    inoremap <silent><expr> <Tab>
    \ UltiSnips#CanJumpForwards() ? "\<C-r>=UltiSnips#JumpForwards()\<CR>" :
    \ UltiSnips#CanExpandSnippet() ? "\<C-r>=UltiSnips#ExpandSnippet()\<CR>" :
    \ "\<Tab>"
    "
    snoremap <silent> <Tab> <Esc>:call UltiSnips#JumpForwards()<CR>

    inoremap <silent><expr> <S-Tab>
    \ UltiSnips#CanJumpBackwards() ? "\<C-r>=UltiSnips#JumpBackwards()\<CR>" :
    \ "\<C-d>"

    snoremap <silent> <S-Tab> <Esc>:call UltiSnips#JumpBackwards()<CR>
  ]])

  local ultisnips_augroup = vim.api.nvim_create_augroup("UltisipsCustomGroup", { clear = true })

  vim.api.nvim_create_autocmd("User", {
    pattern = { "UltiSnipsEnterFirstSnippet" },
    group = ultisnips_augroup,
    callback = function()
      vim.diagnostic.enable(false)
      vim.defer_fn(function()
        vim.diagnostic.enable(true)
      end, 1000)
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = { "UltiSnipsExitLastSnippet" },
    group = ultisnips_augroup,
    callback = function() end,
  })

  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "**/docker-compose.*",
    callback = function()
      vim.cmd("UltiSnipsAddFiletypes yaml.docker-compose")
    end,
  })
end

return {
  -- "SirVer/ultisnips",
  -- enabled = true,
  -- config = config,
}
