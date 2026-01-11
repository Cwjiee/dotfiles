return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    on_attach = function(buffr)
      vim.keymap.set('n', '<leader>b', function() gitsigns.blame_line{full=true} end, {})
    end,

    preview_config = {
      border = 'rounded',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
  }
}
