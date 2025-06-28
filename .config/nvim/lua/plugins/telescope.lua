return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require('telescope').setup{
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            height = 0.7,
            width = 0.9,
            prompt_position = 'top',
            preview_width = 0.60,
          },
        },
        -- sorting_strategy = "ascending"
      },
    }

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>gt', builtin.git_status, {})
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
  end
}
