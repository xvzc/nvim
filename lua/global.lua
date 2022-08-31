local global = {}

local trim = function(s)
  return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local syscall = function(cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()

  return s
end

local run_python = function()
  vim.cmd("silent w")
  local cur_buffer = vim.api.nvim_buf_get_name(0)
  print(syscall('python3 '..cur_buffer..' 2>&1'))
end

local run_cpp = function()
  vim.cmd("silent w")
  local cur_buffer = vim.api.nvim_buf_get_name(0)
  local compile_cmd = 'g++ -std=c++17 -O2 -Wall -Wno-sign-compare -DLOCAL '..cur_buffer..' -o ./a.out 2>&1'
  local compile_out = vim.fn.system(compile_cmd)
  local cur_path = vim.fn.getcwd()

  if vim.api.nvim_get_vvar('shell_error') == 1 then
    print(compile_out)
    return
  end

  print(syscall(cur_path..'/a.out'..' 2>&1'))
end

local run_sh = function()
  vim.cmd("silent w")
  print(vim.fn.system('zsh '..vim.api.nvim_buf_get_name(0)..' 2>&1'))
end

local boj_submit = function()
  vim.cmd("silent w")
  local cur_buffer = vim.api.nvim_buf_get_name(0)
  local output = syscall('python3 $BAEKJOON_CLI/boj-submit.py '..cur_buffer)
  print(output)
end

local map = function(mode, from, handle, options)
  vim.keymap.set(mode, from, handle, options)
end

local nmap = function(from, handle, options)
  global.map('n', from, handle, options)
end

local vmap = function (from, handle, options)
  global.map('v', from, handle, options)
end

local imap = function(from, handle, options)
  global.map('i', from, handle, options)
end

local smap = function(from, handle, options)
  global.map('s', from, handle, options)
end

local osid = function()
  local uname = io.popen("uname -a")
  if uname == nil then
    vim.notify("global:uname() error", 4)
    return ""
  end

  local result = uname:read("*a")
  uname:close()

  if string.find(result, "Darwin") then
    return "mac"
  elseif string.find(result, "arch") then
    return "linux-arch"
  else
    vim.notify("global:uname() unknown os", 4)
    return ""
  end
end

local find_lua_files = function(path)
  local pattern = [[v:val =~ '\.lua$']]

  local list = {}
  for i, file in ipairs(vim.fn.readdir(path, pattern)) do
    list[i] = file:gsub('%.lua$', '')
  end

  return list
end

function global:new()
  -- variables
  self.osid = osid()
  self.home = os.getenv('HOME')
  self.lsp_config_path = global.home..'/.config/nvim/lua/settings/language-servers'
  self.config_path = global.home..'/.config/nvim/lua/settings'
  self.language_servers_path = global.config_path..'/language-servers' 

  -- functions()
  self.syscall = syscall
  self.run_python = run_python
  self.run_cpp = run_cpp
  self.run_sh = run_sh
  self.boj_submit = boj_submit
  self.map = map
  self.nmap = nmap
  self.vmap = vmap
  self.imap = imap
  self.smap = smap
  self.trim = trim
  self.dump = dump
  self.find_lua_files = find_lua_files
  self.autocmd = vim.api.nvim_create_autocmd

  return self
end

return global:new()
