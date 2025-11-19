{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "monospace";
      size = 10;
    };
    themeFile = "Catppuccin-Mocha";
    settings = {
      confirm_os_window_close = "0";
      background_opacity = "0.7";
    };
  };
}
