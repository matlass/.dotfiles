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
        "${paths.nix-d-nord-purple}"
      ];
      wallpaper = [
        ",${paths.nix-d-nord-purple}"
      ];
    };
  };
}
