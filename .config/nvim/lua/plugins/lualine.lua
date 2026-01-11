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
  event = "VeryLazy",
  config = function()

    local function get_lsp_name()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if next(clients) == nil then return 'No LSP' end
      local names = {}
      for _, client in ipairs(clients) do table.insert(names, client.name) end
      return ' ' .. table.concat(names, ', ') -- Added a small icon
    end

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
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {
            { get_lsp_name, color = { fg = '#ffffff', gui = 'bold' } },
            'encoding',
            'fileformat',
            'filetype'
          },
          lualine_y = {'progress'},
          lualine_z = { 'location' },

          -- lualine_c = {
          --   'filename',
          --   -- {
          --   --   function()
          --   --     return vim.g.spotify_song or ''
          --   --   end,
          --   --   icon = '🎵',
          --   --   color = { fg = '#b4befe', gui = 'bold' },
          --   -- },
          -- },
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
