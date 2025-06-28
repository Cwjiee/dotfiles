local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local DEFAULT_OPACITY = 0.9
-- Define the toggled opacity (e.g., fully opaque)
local TOGGLED_OPACITY = 1.0

-- Set the initial window background opacity
config.window_background_opacity = DEFAULT_OPACITY

-- This function will be called when a user variable changes.
-- We'll use it to respond to our external opacity toggle script.
wezterm.on('user-var-changed', function(window, pane, name, value)
    -- Check if the changed user variable is our opacity toggle variable
    if name == 'WEZTERM_OPACITY_TOGGLE' then
        local overrides = window:get_config_overrides() or {}
        local current_opacity = overrides.window_background_opacity or config.window_background_opacity

        -- Determine the new opacity based on the current one
        local new_opacity
        if current_opacity == DEFAULT_OPACITY then
            new_opacity = TOGGLED_OPACITY
        else
            new_opacity = DEFAULT_OPACITY
        end

        -- Apply the new opacity using config overrides
        -- This changes the setting for the specific window
        overrides.window_background_opacity = new_opacity
        window:set_config_overrides(overrides)

        -- Optional: Show a toast notification to confirm the change
        local opacity_status = string.format("Opacity: %.1f", new_opacity)
        window:toast_notification("WezTerm Opacity Toggled", opacity_status, nil, 1000)
    end
end)


config.initial_cols = 80
config.initial_rows = 21
-- config.font = wezterm.font("FiraCode Nerd Font")
config.font = wezterm.font("Maple Mono")
config.font_size = 20
config.hide_tab_bar_if_only_one_tab = true
config.front_end = "WebGpu"
config.color_scheme = 'Catppuccin Mocha'
-- config.window_background_image_hsb = { brightness = 0.1, saturation = 0.7 }
config.window_background_opacity = 0.85
-- config.window_background_opacity = 0.75
-- config.macos_window_background_blur = 25
config.text_background_opacity = 1.00
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.default_workspace = "home"

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  { key = "f", mods = "CMD|CTRL", action = "ToggleFullScreen" },
  {
    key = '%',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical,
  },
  {
    key = '"',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal,
  },
}

config.colors = {
  -- background = '#1e1e2e',

  -- cursor_fg = '#11111b',
  -- cursor_bg = '#f5e0dc',
  -- cursor_border = '#f2cdcd',

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

return config

