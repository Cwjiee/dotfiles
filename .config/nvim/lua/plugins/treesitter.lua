return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        "python", "lua", "vim", "vimdoc", "javascript",
        "typescript", "tsx", "html", "css", "json",
        "yaml", "markdown", "markdown_inline", "bash",
        "dockerfile", "gitignore", "ruby"
      },
      auto_install = true,
    })
  end,
}
