local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

local config = {
  ensure_installed = {
    "c",
    "cpp",
    "go",
    "lua",
    "vim",
    "bash",
    "dockerfile",
    "kotlin",
    "java",
    "python",
    "regex",
    "ruby",
    "tsx",
    "typescript",
    "javascript",
    "yaml",
    "hcl",
    "cmake",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

treesitter.setup(config)
