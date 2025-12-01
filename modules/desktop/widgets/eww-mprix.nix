{
  config,
  pkgs,
  ...
}: {
  programs.eww = {
    enable = true;
    configDir = ./eww;
  };

  home.packages = with pkgs; [
    playerctl
    jq
  ];
}
