{
  config,
  pkgs,
  ...
}: {
  services.rescuetime.enable = true;

  home.packages = with pkgs; [
    rescuetime
  ];
}
