{
  config,
  pkgs,
  ...
}: {
  programs.eww = {
    enable = true;
    configDir = ./widgets;
  };

  home.packages = with pkgs; [
    playerctl
    jq
  ];
}
