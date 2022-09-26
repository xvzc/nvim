-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/jerry/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/jerry/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/jerry/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/jerry/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jerry/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bufferline.nvim"] = {
    config = { "require('settings.bufferline')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\23cmp_nvim_ultisnips\frequire\0" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["dashboard-nvim"] = {
    config = { "require('settings.dashboard-nvim')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  fzf = {
    config = { "require('settings.fzf')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('settings.indent-blankline')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    config = { "require('settings.lualine')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('settings.lualine')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason.nvim"] = {
    config = { "require('settings.mason')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('settings.nvim-autopairs')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "require('settings.nvim-cmp')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "require('settings.nvim-lspconfig')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "require('settings.nvim-tree')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('settings.treesitter')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  tabular = {
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["toggleterm.nvim"] = {
    config = { "require('settings.toggleterm')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ultisnips = {
    config = { "require('settings.ultisnips')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-easymotion"] = {
    config = { "require('settings.easymotion')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    config = { "require('settings.vim-gitgutter')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-js"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/opt/vim-js",
    url = "https://github.com/yuezk/vim-js"
  },
  ["vim-jsx-pretty"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/opt/vim-jsx-pretty",
    url = "https://github.com/maxmellon/vim-jsx-pretty"
  },
  ["vim-lastplace"] = {
    config = { "require('settings.vim-lastplace')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/opt/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-surround"] = {
    config = { "require('settings.vim-surround')" },
    loaded = true,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["yajs.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/opt/yajs.vim",
    url = "https://github.com/othree/yajs.vim"
  },
  ["yats.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jerry/.local/share/nvim/site/pack/packer/opt/yats.vim",
    url = "https://github.com/HerringtonDarkholme/yats.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('settings.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: cmp-nvim-ultisnips
time([[Config for cmp-nvim-ultisnips]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\23cmp_nvim_ultisnips\frequire\0", "config", "cmp-nvim-ultisnips")
time([[Config for cmp-nvim-ultisnips]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('settings.nvim-lspconfig')
time([[Config for nvim-lspconfig]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require('settings.toggleterm')
time([[Config for toggleterm.nvim]], false)
-- Config for: fzf
time([[Config for fzf]], true)
require('settings.fzf')
time([[Config for fzf]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)
require('settings.ultisnips')
time([[Config for ultisnips]], false)
-- Config for: vim-surround
time([[Config for vim-surround]], true)
require('settings.vim-surround')
time([[Config for vim-surround]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
require('settings.mason')
time([[Config for mason.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
require('settings.bufferline')
time([[Config for bufferline.nvim]], false)
-- Config for: lazygit.nvim
time([[Config for lazygit.nvim]], true)
require('settings.lualine')
time([[Config for lazygit.nvim]], false)
-- Config for: vim-easymotion
time([[Config for vim-easymotion]], true)
require('settings.easymotion')
time([[Config for vim-easymotion]], false)
-- Config for: vim-gitgutter
time([[Config for vim-gitgutter]], true)
require('settings.vim-gitgutter')
time([[Config for vim-gitgutter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('settings.lualine')
time([[Config for lualine.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('settings.nvim-cmp')
time([[Config for nvim-cmp]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('settings.indent-blankline')
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require('settings.nvim-tree')
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('settings.nvim-autopairs')
time([[Config for nvim-autopairs]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'vim-jsx-pretty'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType js ++once lua require("packer.load")({'vim-js', 'yajs.vim', 'yats.vim'}, { ft = "js" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "md" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'dashboard-nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'vim-lastplace'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/jerry/.local/share/nvim/site/pack/packer/opt/vim-js/ftdetect/javascript.vim]], true)
vim.cmd [[source /Users/jerry/.local/share/nvim/site/pack/packer/opt/vim-js/ftdetect/javascript.vim]]
time([[Sourcing ftdetect script at: /Users/jerry/.local/share/nvim/site/pack/packer/opt/vim-js/ftdetect/javascript.vim]], false)
time([[Sourcing ftdetect script at: /Users/jerry/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescript.vim]], true)
vim.cmd [[source /Users/jerry/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescript.vim]]
time([[Sourcing ftdetect script at: /Users/jerry/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescript.vim]], false)
time([[Sourcing ftdetect script at: /Users/jerry/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescriptreact.vim]], true)
vim.cmd [[source /Users/jerry/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescriptreact.vim]]
time([[Sourcing ftdetect script at: /Users/jerry/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescriptreact.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
