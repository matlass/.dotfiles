{
  description = "Mi flaque :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
    ts-comments-nvim = {
      url = "github:folke/ts-comments.nvim";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stable,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    paths = import ./lib/paths.nix {inherit inputs;};
  in {
    nixosConfigurations.bok = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs paths;
      };
      modules = [
        ./hosts/bok/configuration.nix
      ];
    };

    homeConfigurations.matthieu = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs;
      modules = [
        inputs.nvf.homeManagerModules.default
        ./home.nix
      ];
      extraSpecialArgs = {inherit inputs paths;};
    };
  };
  #For gcc
  packages.${system}.sdl-fhs = pkgs.buildFHSEnv {
    name = "sdl-dev";
    targetPkgs = pkgs:
      with pkgs; [
        gcc
        gnumake
        sdl2
        sdl2_image
      ];
    runScript = "bash";
    profile = ''
      export SDL2_INCLUDE_PATH="${pkgs.sdl2. dev}/include/SDL2"
      export C_INCLUDE_PATH="${pkgs.sdl2. dev}/include:${pkgs. sdl2_image.dev}/include"
      export LIBRARY_PATH="${pkgs.sdl2}/lib:${pkgs.sdl2_image}/lib"
    '';
  };
  devShells.${system}.default = self.packages.${system}.sdl-fhs. env;
}
