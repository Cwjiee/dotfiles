# home.nix

{ config, pkgs, ... }:

{
  home.username = "weijie";
  home.homeDirectory = "/Users/weijie";
  home.stateVersion = "23.05";
  home.packages = [
    pkgs.bat
    pkgs.btop
    pkgs.lazygit
    pkgs.starship
    pkgs.git
    pkgs.yazi
    pkgs.fzf
    pkgs.ripgrep
    pkgs.lsd
    pkgs.tmate
    # pkgs.gh
    pkgs.zoxide
    pkgs.wezterm
    # pkgs.tmux
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/davish/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  imports = import ./modules;
}
