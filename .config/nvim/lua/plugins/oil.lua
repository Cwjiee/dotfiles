return {
  'stevearc/oil.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = false,
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,
        is_always_hidden = function(name, bufnr)
          return vim.startswith(name, "..")
        end,
      },
      columns = {
        "icon",
        "permissions",
      }
    })
  end,
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
  },
}
