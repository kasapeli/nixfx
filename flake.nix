{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }:
    {
      nixosConfigurations = {
        nix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            stylix.nixosModules.stylix
            ./configuration.nix
            ./hardware-configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.sam = {
                imports = [ ./main/home.nix ];
              };
            }
          ];
        };
      };
    };
}
