{ config, pkgs, inputs, paths, ...}:
{
  imports = [
    ./modules
  ];

  programs.home-manager = {
    enable = true;
  };

  home.username = "matthieu";
  home.homeDirectory = "/home/matthieu";
  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };
}
