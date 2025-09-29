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
        "${paths.nixDarkImage}"
        "/home/matthieu/Downloads/nix-d-nord-purple.jpg"
      ];
      wallpaper = [
        # ",${paths.nixDarkImage}"
        "/home/matthieu/Downloads/nix-d-nord-purple.jpg"
      ];
    };
  };
}
