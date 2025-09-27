local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.initial_cols = 80
config.initial_rows = 21
config.font = wezterm.font("Maple Mono")
config.font_size = 16
config.hide_tab_bar_if_only_one_tab = true
config.front_end = "WebGpu"
config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.85
-- config.macos_window_background_blur = 25
config.text_background_opacity = 1.00
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE|TITLE"
config.default_workspace = "home"
-- local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
-- tabline.setup({ options = { theme = "catppuccin-mocha" } })

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

return config

