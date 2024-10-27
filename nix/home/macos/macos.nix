# home.nix

{ config, pkgs, ... }:

{
  home.username = "weijie";
  home.homeDirectory = "/Users/weijie";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    bat
    btop
    lazygit
    starship
    git
    yazi
    fzf
    ripgrep
    lsd
    tmate
    gh
    zoxide
    wezterm
    tmux
    zsh
    fastfetch
    fd
    silver-searcher
    croc
    asciinema
    cmatrix
    figlet
    htop
    neovim
  ];

  home.file = {
    ".config/nvim".source = ~/dotfiles/nvim;
    ".config/wezterm".source = ~/dotfiles/wezterm;
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

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  imports = import ../modules;
}
