{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nvf.url = "github:NotAShelf/nvf";
  };
  
  outputs = { self, nixpkgs, nvf }: {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    nixosConfiguration.bok = nixpkgs.lib.nixosSystem {
      modules = [ 
      nvf.nvf.homeManagerModules.default
      ./configuration.nix
      ./home.nix
      ];
    };
  };
}
