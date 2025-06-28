# home.nix

{ config, pkgs, ... }:

{
  home.username = "weijie";
  home.homeDirectory = "/Users/weijie";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    bat
    btop
    # lazygit
    starship
    git
    yazi
    fzf
    ripgrep
    lsd
    tmate
    gh
    zoxide
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
    slides
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  imports = import ../modules;
}
