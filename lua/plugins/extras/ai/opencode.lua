---@type snacks.terminal.Opts
local snacks_terminal_opts = {
  win = {
    position = "float",
    enter = true,
    on_win = function(win)
      -- Set up keymaps and cleanup for an arbitrary terminal
      require("opencode.terminal").setup(win.win)
    end,
  },
}

return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      "folke/snacks.nvim",
      optional = false,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...)
              return require("plugins.dev.opencode.init").snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                -- ["<C-y>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    vim.g.opencode_opts = {
      events = {
        enabled = true,
        reload = true,
        permissions = {
          enabled = true,
          idle_delay_ms = 1000,
          edits = {
            enabled = true,
          },
        },
      },
    }

    local function ref(at)
      -- local template = '<!-- @ref:path style="absolute" at="%s" /-->'
      local template = '<ref:path style="absolute" at="%s" />'
      return string.format(template, at)
    end

    local function block(at)
      local template = '<task style="absolute" at="%s">\n\n' .. "</task>"
      -- local template = '<!-- @instruction:path sylte="absolute" at="%s" -->\n\n'
      --   .. "<!-- /@instruction:path -->"
      return string.format(template, at)
    end

    -- local tmpbuf = require("tmpbuf")
    -- local tmpbuf_name = "Opencode Prompt"

    -- vim.keymap.set({ "n" }, "<C-x>i", function()
    --   local on_attach = function()
    --     vim.keymap.set({ "n" }, "<C-x><CR>", function()
    --       local content = tmpbuf.content(tmpbuf_name)
    --       if content == nil then
    --         return
    --       end
    --
    --       require("opencode").prompt(table.concat(content, "\n"), {})
    --       tmpbuf.clear(tmpbuf_name)
    --       tmpbuf.close(tmpbuf_name)
    --     end, { silent = true, noremap = true })
    --   end
    --   tmpbuf.toggle(tmpbuf_name, { on_attach = on_attach, filetype = "markdown" }, {})
    -- end, { silent = true, noremap = true })

    local group = vim.api.nvim_create_augroup("NvimTreeOpencodeHook", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = "NvimTree",
      callback = function(ev)
        -- vim.keymap.set({ "n" }, "<leader>aa", function()
        --   local nt_api = require("nvim-tree.api")
        --   local node = nt_api.tree.get_node_under_cursor()
        --   local filepath = vim.fn.fnamemodify(node.absolute_path, ":~")
        --
        --   tmpbuf.insert_between_tags(tmpbuf_name, ref(filepath), {
        --     start_tag = "<context>",
        --     end_tag = "</context>",
        --     -- start_tag = "<!-- @context -->",
        --     -- end_tag = "<!-- /@context -->",
        --     indent = 2,
        --     init_at = function(bufnr, start_line, end_line)
        --       return { line_num = start_line, prepend = true }
        --     end,
        --     insert_at = function(bufnr, start_line, end_line)
        --       return { line_num = end_line - 1, prepend = false }
        --     end,
        --   })
        -- end, { silent = true, noremap = true, buffer = ev.buf })
        --
        -- vim.keymap.set({ "n" }, "<leader>ab", function()
        --   if vim.bo.filetype ~= "NvimTree" then
        --     return
        --   end
        --
        --   local nt_api = require("nvim-tree.api")
        --   local node = nt_api.tree.get_node_under_cursor()
        --   local filepath = vim.fn.fnamemodify(node.absolute_path, ":~")
        --
        --   tmpbuf.insert(tmpbuf_name, block(filepath), {
        --     insert_at = function(start_line, end_line, bufnr)
        --       return { line_num = end_line - 1, prepend = false }
        --     end,
        --   })
        -- end, { silent = true, noremap = true, buffer = ev.buf })
      end,
    })

    -- Recommended/example keymaps
    -- vim.keymap.set({ "n" }, "<leader>aa", function()
    --   require("opencode").prompt(ref("@buffer"), {})
    -- end, { desc = "Add the buffer to context" })
    --
    -- vim.keymap.set({ "n" }, "<leader>ab", function()
    --   require("opencode").prompt(block("@buffer"), {})
    -- end, { desc = "Add the buffer to context" })
    --
    -- vim.keymap.set({ "x" }, "<leader>aa", function()
    --   require("opencode").prompt(ref("@this"), {})
    -- end, { desc = "Add the selection to context" })
    --
    -- vim.keymap.set({ "x" }, "<leader>ab", function()
    --   require("opencode").prompt(block("@this"), {})
    -- end, { desc = "Add the selection to context" })
    --
    -- vim.keymap.set({ "n" }, "<leader>ad", function()
    --   require("opencode").prompt("@diff: ", { submit = true })
    -- end, { desc = "Ask about diff" })
    --
    -- vim.keymap.set({ "n" }, "<leader>ai", function()
    --   require("opencode").prompt("@diagnostic: ", { submit = true })
    -- end, { desc = "Ask about diagnostic" })
    --
    -- vim.keymap.set({ "n", "x" }, "<leader>ax", function()
    --   require("opencode").select()
    -- end, { desc = "Execute opencode action" })
  end,
}
