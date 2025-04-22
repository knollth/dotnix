{
  description = "Combined NixOS system and Home Manager user configuration for tom";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    musnix  = {
      url = "github:musnix/musnix"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, nvf, musnix,... }@inputs:
    let
      system = "x86_64-linux"; # Or choose your actual system arch
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./nixos/configuration.nix
          inputs.musnix.nixosModules.musnix
          inputs.stylix.nixosModules.stylix
          # === IMPORTANT ===
          # Ensure your system/configuration.nix does NOT import
          # inputs.home-manager.nixosModules.default or try to manage
          # users.users.<username>.imports = [ ... ]; with home-manager modules.
          # Home Manager is managed separately below.
        ];
      };

      homeConfigurations.tom = home-manager.lib.homeManagerConfiguration {
        inherit pkgs; # Use the pkgs defined above

        extraSpecialArgs = {
           inherit inputs;
         };

        modules = [
          nvf.homeManagerModules.default
          ./home/home.nix
        ];
      };
    };
}
