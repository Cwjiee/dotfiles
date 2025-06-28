-- local script_path = "/Users/weijie/code/scripts/spotify-nvim/spotify-nvim.scpt"
-- 
-- local function get_spotify_song()
--   local result = vim.fn.system({ 'osascript', script_path })
--   if vim.v.shell_error == 0 then
--     return vim.trim(result)
--   else
--     return 'not working'
--   end
-- end
-- 
-- local last_song = ''
-- 
-- vim.g.spotify_song = get_spotify_song()
-- last_song = vim.g.spotify_song
-- 
-- vim.fn.timer_start(30 * 1000, function()
--   vim.schedule(function()
--     local new_song = get_spotify_song()
--     if new_song ~= last_song then
--       vim.g.spotify_song = new_song
--       last_song = new_song
--     end
--   end)
-- end, { ['repeat'] = -1 })

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = " ",
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        -- lualine_c = {'filename'},
        lualine_c = {
          'filename',
          -- {
          --   function()
          --     return vim.g.spotify_song or ''
          --   end,
          --   icon = '🎵',
          --   color = { fg = '#b4befe', gui = 'bold' },
          -- },
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
