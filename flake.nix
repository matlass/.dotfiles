{
  description = "Mi flaque :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, home-manager, stable, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations.bok = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./configuration.nix
      ];
    };

    homeConfigurations.matthieu = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs; #nixpkgs.legacyPackages.x86_64-linux;
      modules = [ 
        inputs.nvf.homeManagerModules.default
        ./home.nix 
      ];
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
