local profile = {}

local get_osid = function()
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
  elseif string.find(result, "Ubuntu") then
    return "linux-ubuntu"
  else
    vim.notify("global:uname() unknown os", 4)
    return ""
  end
end

function profile:new()
  -- variables
  self.osid = get_osid()
  self.home = os.getenv('HOME')
  self.author = os.getenv("AUTHOR")
  self.work_dir = os.getenv('WORK_DIR')
  self.personal_dir = os.getenv("PERSONAL_DIR")
  if (self.author == nil or self.author == '') then
    self.author = "anonymous"
  end
  return self
end

return profile:new()
