return {
  {"tpope/vim-endwise", event = "FileType", ft = { "ruby", "vim", "sh", "lua" } },
  {"windwp/nvim-autopairs", event = "InsertEnter" },
  -- {"christoomey/vim-tmux-navigator"}
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {},
  },
  {"folke/zen-mode.nvim", cmd = "ZenMode"},
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
