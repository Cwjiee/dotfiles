{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local config = wezterm.config_builder()

      config.font = wezterm.font("FiraCode Nerd Font")
      config.font_size = 16.0
      config.hide_tab_bar_if_only_one_tab = true
      config.front_end = "WebGpu"
      config.color_scheme = 'Catppuccin Mocha'

      config.keys = {
        {key="f", mods="CMD|CTRL", action="ToggleFullScreen"},
      }

      config.colors = {
        tab_bar = {
          background = '#0b0022',

          active_tab = {
            bg_color = '#2b2042',
            fg_color = '#c0c0c0',

            intensity = 'Normal',
            underline = 'None',
            italic = false,
            strikethrough = false,
          },

          inactive_tab = {
            bg_color = '#1b1032',
            fg_color = '#808080',
          },

          inactive_tab_hover = {
            bg_color = '#3b3052',
            fg_color = '#909090',
            italic = true,
          },

          new_tab = {
            bg_color = '#1b1032',
            fg_color = '#808080',
          },

          new_tab_hover = {
            bg_color = '#3b3052',
            fg_color = '#909090',
            italic = true,
          },
        },
      }


      local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
      bar.apply_to_config(config)

      return config
    '';
  };
}
