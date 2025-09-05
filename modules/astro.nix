{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    rapidraw
    siril
    gimp3
    stellarium
  ];
}
