return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
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
        file_ignore_patterns = {
          "node_modules/",
          "build/",
          "dist/",
        },
        sorting_strategy = "ascending"
      },
      pickers = {
        find_files = {
          show_hidden = true,
        },
      }
    }
  end,
  keys = {
    { '<leader>gt', function() require('telescope.builtin').git_status() end, {} },
    { '<leader>pf', function() require('telescope.builtin').find_files() end, {} },
    { '<leader>ps', function() require('telescope.builtin').live_grep() end, {} },
    { '<leader>gb', function() require('telescope.builtin').git_branches() end, {} },
  }
}
