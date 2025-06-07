local avante = require("avante")
avante.setup({
  openai = {
    provider = "openai",
    endpoint = "https://api.openai.com/v1",
    model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
    timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
    -- temperature = 0,
    -- max_completion_tokens = 8192,
  },
})
