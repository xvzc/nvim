return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false, -- removes asking for luassert
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
