{ config, pkgs, ... }:

{
  home.username = "weijie";
  home.homeDirectory = "/Users/weijie";
  home.stateVersion = "24.05";
  home.packages = [
    pkgs.git
    pkgs.fastfetch
    pkgs.tmux
    pkgs.lazygit
    pkgs.bat
    pkgs.btop
    pkgs.yazi
    pkgs.starship
    pkgs.fzf
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/weijie/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  imports = import ./modules;
}
