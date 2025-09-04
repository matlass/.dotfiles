{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    rapidraw
    siril
    gimp3
  ];
}
