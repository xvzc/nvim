local function ref(at)
  return {
    string.format('#ref(kind: "path", at: "%s")', at),
  }
end

local template = [[#import "@local/prompt:0.1.0": *

#let metadata = (
  doctype: "typst",
)

= Context

= Tasks

= Guides
]]
local function on_attach(bufnr)
  vim.keymap.set({ "n", "x" }, "tr", function()
    local contents = ref(require("bufsitter.ref").get())
    require("bufsitter.io").insert(bufnr, contents, {
      inline = false,
      prepend = false,
      cursor = require("bufsitter.cursor")
        .root()
        :children({ types = { "section" } })
        :children({ types = { "heading" } })
        :children({ types = { "text" } })
        :filter(function(b, node)
          return vim.treesitter.get_node_text(node, b) == "Context"
        end)
        :first()
        :parent()
        :parent(),
    })
  end, { silent = true, noremap = true })

  vim.treesitter.start()

  local client_id = vim.lsp.start(vim.lsp.config["tinymist"])
  if client_id ~= nil then
    vim.lsp.buf_attach_client(bufnr, client_id)
    local ns = vim.lsp.diagnostic.get_namespace(client_id)
    vim.diagnostic.config({ signs = false }, ns)
  end
end

return {
  "xvzc/bufsitter.nvim",
  enabled = true,
  -- event = "VeryLazy",
  -- dir = "~/personal/bufsitter.nvim",
  opts = {
    scratch = {
      win = {
        width = 0.7,
        height = 0.8,
      },
      ext = "typ",
      init_contents = vim.split(template, "\n"),
    },
    ref = {
      expand = false,
      hook = function(r)
        local project_root = vim.env.PROJECT_ROOT
        if project_root and type(project_root) == "string" and project_root ~= "" then
          project_root = vim.fn.fnamemodify(project_root, ":~")
          if project_root:sub(-1) ~= "/" then
            project_root = project_root .. "/"
          end

          local safe_pattern = project_root:gsub("([^%w])", "%%%1")
          r, _ = r:gsub(safe_pattern, "@")

          return r
        end
      end,
    },
  },
  init = function()
    local Scratch = require("bufsitter.scratch").new({
      on_attach = on_attach,
    })

    vim.keymap.set({ "n" }, "<leader>b", function()
      Scratch:toggle()
    end, { silent = true, noremap = true })
  end,
}
