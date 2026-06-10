return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    on_attach = function(bufnr)
      local gs = require('gitsigns')
      local function blame()
        gs.blame_line{full=true}
      end
      vim.keymap.set('n', '<leader>b', blame, {buffer = bufnr})
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
