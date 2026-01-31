{
  description = "NixOS system and Home Manager configuration of taran";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:FlameFlag/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, home-manager, niri, dms, zen-browser, nixcord, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
      {
        nixosConfigurations."braino" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./system/configuration.nix
            ./system/hardware-configuration.nix
          ];
        };
      homeConfigurations."braino" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./modules/home.nix
          ./modules/sh.nix
          ./modules/terminal
          ./modules/editors
          ./modules/file_managers
          ./modules/browsers
          ./modules/messengers
          nixcord.homeModules.nixcord
          niri.homeModules.niri
          dms.homeModules.dankMaterialShell.default
          zen-browser.homeModules.beta
        ];
      };
    };
}
