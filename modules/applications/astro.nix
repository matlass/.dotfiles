{config, pkgs, ...}:
{
  home.packages = with pkgs; [
    rapidraw
    siril
    gimp3
    stellarium
  ];
}