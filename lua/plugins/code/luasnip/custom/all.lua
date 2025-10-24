local shared = require("plugins.code.luasnip.modules.shared")
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local t = ls.text_node

local get_cstring = shared.get_cstring

local box_char = {
  left_top = "",
  left_bot = "",
  right_top = "",
  rifht_bot = "",
  vert = "",
  hori = "",
}

local function create_box(opts)
  local cs = "//"

  -- stylua: ignore start
  return {
    f(function(args)
      return cs .. " " .. string.rep("*", string.len(args[1][1]) + 2)
    end, { 1 }),

    t({ "", "" }),
    -- f(function(args)
    --   return cs .. string.rep(" ", string.len(args[1][1]) + 2)
    -- end, { 1 }),
    t(cs.. " ", ""), i(1, "box"),
    -- f(function(args)
    --   return cs .. string.rep(" ", string.len(args[1][1]) + 2)
    -- end, { 1 }),
    t({ "", "" }),

    f(function(args)
      return cs .. " " .. string.rep("*", string.len(args[1][1]) + 2)
    end, { 1 }),
  }
  -- stylua: ignore end
end

return {
  s({ trig = "box" }, create_box({ padding_length = 3 })),
  s({ trig = "bbox" }, create_box({ padding_length = 3 })),
}
