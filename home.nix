{
  config,
  pkgs,
  inputs,
  paths,
  ...
}: {
  imports = [
    ./modules
  ];

  programs.home-manager = {
    enable = true;
  };

  home.username = "matthieu";
  home.homeDirectory = "/home/matthieu";
  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;
  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };

  home.packages = with pkgs; [
  ];
}
