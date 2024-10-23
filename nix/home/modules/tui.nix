{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    catppuccin.enable = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_by = "modified";
        sort_reverse = true;
      };
      preview = {
        max_width = 800;
      };
    };
  };

  programs.lazygit = {
    enable = true;
    catppuccin.enable = true;
  };
}
