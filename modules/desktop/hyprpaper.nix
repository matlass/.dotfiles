{
  config,
  pkgs,
  paths,
  ...
}: {
  #Hyprpaper config
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = [
        "${pkgs.nix-d-nord-purple}"
      ];
      wallpaper = [
        ",${pkgs.nix-d-nord-purple}"
      ];
    };
  };
}
