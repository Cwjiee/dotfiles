local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- wezterm.on('update-right-status', function(window, pane)
--   local keytable_name = window:active_key_table()
--   if keytable_name then
--     keytable_name = 'TABLE: ' .. keytable_name
--   end
--   window:set_left_status(keytable_name or ' ')
--   window:set_right_status(' ')
-- end)

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
workspace_switcher.apply_to_config(config)

local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

config.initial_cols = 106
config.initial_rows = 21
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 16.0
config.hide_tab_bar_if_only_one_tab = true
config.front_end = "WebGpu"
config.color_scheme = 'Catppuccin Mocha'
-- config.window_background_image = '/Users/weijie/Documents/wallpapers/Lowpoly_Street.png'
config.window_background_image_hsb = { brightness = 0.1, saturation = 0.7 }
config.window_background_opacity = 0.70
config.text_background_opacity = 0.7
config.macos_window_background_blur = 0
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true

config.leader = { key = 'm', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  { key = "f", mods = "CMD|CTRL", action = "ToggleFullScreen" },

  { key = 'h', mods = 'CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'CTRL', action = act.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'CTRL', action = act.ActivatePaneDirection 'Down' },

  {
    key = '"',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '%',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = "r",
    mods = "LEADER",
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
    }
  },

  { key = "s", mods = "CMD", action = workspace_switcher.switch_workspace() },

  {
    key = "w",
    mods = "ALT",
    action = wezterm.action_callback(function(win, pane)
      resurrect.save_state(resurrect.workspace_state.get_workspace_state())
    end),
  },
  {
    key = "W",
    mods = "ALT",
    action = resurrect.window_state.save_window_action(),
  },
  {
    key = "T",
    mods = "ALT",
    action = resurrect.tab_state.save_tab_action(),
  },
  {
    key = "s",
    mods = "ALT",
    action = wezterm.action_callback(function(win, pane)
      resurrect.save_state(resurrect.workspace_state.get_workspace_state())
      resurrect.window_state.save_window_action()
    end),
  },
  {
    key = "r",
    mods = "ALT",
    action = wezterm.action_callback(function(win, pane)
      resurrect.fuzzy_load(win, pane, function(id, label)
        local type = string.match(id, "^([^/]+)") -- match before '/'
        id = string.match(id, "([^/]+)$") -- match after '/'
        id = string.match(id, "(.+)%..+$") -- remove file extention
        local opts = {
          relative = true,
          restore_text = true,
          on_pane_restore = resurrect.tab_state.default_on_pane_restore,
        }
        if type == "workspace" then
          local state = resurrect.load_state(id, "workspace")
          resurrect.workspace_state.restore_workspace(state, opts)
        elseif type == "window" then
          local state = resurrect.load_state(id, "window")
          resurrect.window_state.restore_window(pane:window(), state, opts)
        elseif type == "tab" then
          local state = resurrect.load_state(id, "tab")
          resurrect.tab_state.restore_tab(pane:tab(), state, opts)
        end
      end)
    end),
  },
  {
    key = "d",
    mods = "ALT",
    action = wezterm.action_callback(function(win, pane)
      resurrect.fuzzy_load(win, pane, function(id)
          resurrect.delete_state(id)
        end,
        {
          title = "Delete State",
          description = "Select State to Delete and press Enter = accept, Esc = cancel, / = filter",
          fuzzy_description = "Search State to Delete: ",
          is_fuzzy = true,
        })
    end),
  },
}

config.key_tables = {
  resize_pane = {
    { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

    { key = 'Escape', action = 'PopKeyTable' },
  },
}

config.colors = {
  tab_bar = {
    background = '#1e1e2e',

    active_tab = {
      bg_color = '#b4befe',
      fg_color = '#1e1e2e',

      intensity = 'Normal',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },

    inactive_tab = {
      bg_color = '#1e1e2e',
      fg_color = '#6e6c7e',
    },

    inactive_tab_hover = {
      bg_color = '#b4befe',
      fg_color = '#1e1e2e',
      italic = true,
    },

    new_tab = {
      bg_color = '#1e1e2e',
      fg_color = '#6e6c7e',
    },

    new_tab_hover = {
      bg_color = '#b4befe',
      fg_color = '#1e1e2e',
      italic = true,
    },
  },
}

config.command_palette_bg_color = "#b4befe"
config.command_palette_fg_color = "#1e1e2e"
config.command_palette_font_size = 16.0
config.command_palette_rows = 8

-- wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(config, {
--   position = "bottom",
--   max_width = 32,
--   dividers = "slant_right", -- or "slant_left", "arrows", "rounded", false
--   indicator = {
--     leader = {
--       enabled = false,
--       off = " ",
--       on = " ",
--     },
--     mode = {
--       enabled = true,
--       names = {
--         resize_mode = "RESIZE",
--         copy_mode = "VISUAL",
--         search_mode = "SEARCH",
--       },
--     },
--   },
--   tabs = {
--     numerals = "arabic", -- or "roman"
--     pane_count = "superscript", -- or "subscript", false
--     brackets = {
--       active = { "", ":" },
--       inactive = { "", ":" },
--     },
--   },
--   clock = { -- note that this overrides the whole set_right_status
--     enabled = true,
--     format = "%H:%M", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
--   },
-- })

return config

