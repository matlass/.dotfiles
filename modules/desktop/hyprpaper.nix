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
        ",${paths.nixDarkImage}"
      ];
      wallpaper = [
        ",${paths.nixDarkImage}"
      ];
    };
  };
}
