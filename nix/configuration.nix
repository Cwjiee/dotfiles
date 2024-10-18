{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    mkalias # enabling apps into spotlight
  ];

  # activation script to move mac apps to Application
  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in
    pkgs.lib.mkForce ''
  # Set up applications.
  echo "setting up /Applications..." >&2
  rm -rf /Applications/Nix\ Apps
  mkdir -p /Applications/Nix\ Apps
  find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
  while read src; do
    app_name=$(basename "$src")
    echo "copying $src" >&2
      ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
  done
    '';

  system.defaults = {
    dock.autohide = true;
    dock.show-recents = false;
    dock.persistent-apps = [
      "/Applications/Firefox.app"
      "/Applications/Obsidian.app"
      "/Applications/Spotify.app"
      # "${pkgs.wezterm}/Applications/Wezterm.app"
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
