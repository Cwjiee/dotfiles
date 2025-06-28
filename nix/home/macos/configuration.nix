{ config, pkgs, ... }:

let 
in
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget
    docker
    ansible
    imagemagick
    poppler
    heroku
    rbenv
    asdf-vm
    terraform
    awscli2

    nixfmt-rfc-style
    nixd
  ];

  system.defaults = {
    dock.autohide = true;
    dock.show-recents = false;
    dock.persistent-apps = [
      # "/Applications/Firefox.app"
      "/Applications/Obsidian.app"
      "/Applications/Firefox.app"
      "/Applications/Spotify.app"
      "Applications/WezTerm.app"
      "/Applications/Discord.app"
    ];
    finder.FXPreferredViewStyle = "clmv";
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.NSWindowShouldDragOnGesture = true;
    NSGlobalDomain._HIHideMenuBar = true;
  };

  services.jankyborders = {
    enable = true;
    active_color = "0xffb4befe";
    inactive_color = "0xff414550";
    style = "round";
    width = 4.0;
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  users.users.weijie = {
    name = "weijie";
    home = "/Users/weijie";
  };

}
