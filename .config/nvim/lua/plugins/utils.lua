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
  {"folke/zen-mode.nvim", cmd = "ZenMode"}
}
