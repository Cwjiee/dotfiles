{
  description = "Wei Jie's Nix config MacOS and Arch Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, catppuccin, home-manager }:
    let
      systemMac = "aarch64-darwin";
      systemLinux = "x86_64-linux";
    in {
      # $ darwin-rebuild build --flake .#mac
      darwinConfigurations.mac = nix-darwin.lib.darwinSystem {
        system = systemMac;
        modules = [ 
          ./home/macos/configuration.nix
          home-manager.darwinModules.home-manager
          # catppuccin.nixosModules.catppuccin
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    # home-manager.backupFileExtension = "backup";
            home-manager.users.weijie = {
              imports = [
                ./home/macos/macos.nix
                # ./home.nix
                catppuccin.homeManagerModules.catppuccin
              ];
            };
          }
        ];
      };

      darwinPackages = self.darwinConfigurations.mac.pkgs;

      # homeManagerConfigurations.arch = home-manager.lib.homeManagerConfiguration {
      #   pkgs = import nixpkgs {
      #     system = systemLinux;
      #   };

      #   modules = [
      #     ./home/common/home.nix
      #     ./home/arch/linux.nix
      #   ];
      # };
    };
}
