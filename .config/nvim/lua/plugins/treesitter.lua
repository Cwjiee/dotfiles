return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  opts = {
    autotag = {
      enable = true,
    },
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      autotag = { enable = true, },
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "python",
        "yaml",
        "html",
        "css",
        "markdown",
        "ruby",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
      }
    })
  end,
}
