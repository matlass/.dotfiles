{config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "~/.config/nixos/modules/themes/mocha_kitty.conf";
    font = {
      name = "monospace";
      size = 12;
    };
    settings = {
      cursor_trail = "1";
      cursor_trail_decay = "0.2 0.8";
      confirm_os_window_close = "0";
      background_opacity = "0.7";
    };
  };
}
