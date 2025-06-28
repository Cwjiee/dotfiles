return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup({
      on_attach = function(buffr)
        local gitsigns = require('gitsigns')
        vim.keymap.set('n', '<leader>b', function() gitsigns.blame_line{full=true} end, {})
      end
    })
  end
}
