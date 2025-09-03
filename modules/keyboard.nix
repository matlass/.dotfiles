{ config, pkgs, ... }:

let
  # Path to your kmonad config in your home directory
  kmonadConfig = "${config.home.homeDirectory}/home-row-azerty.kbd";
in
{
  # Install kmonad
  home.packages = [
    pkgs.kmonad
  ];

  # Write the kmonad config file to your home directory
  home.file."home-row-azerty.kbd".text = ''
(defcfg
  input  (device-file "/dev/input/by-path/platform-i8042-serio-0-event-kbd")
  output (uinput-sink "kmonad")
  fallthrough true
)

(defalias
  ah (tap-hold-next-release a lalt)
  sh (tap-hold-next-release s lmeta)
  dh (tap-hold-next-release d lctl)
  fh (tap-hold-next-release f lshift)
  jh (tap-hold-next-release j lalt)
  kh (tap-hold-next-release k lmeta)
  lh (tap-hold-next-release l lctl)
  smh (tap-hold-next-release semicolon lshift)
)

(defsrc
  grave 1 2 3 4 5 6 7 8 9 0 minus equal
  tab q w e r t y u i o p leftbrace rightbrace
  a s d f g h j k l semicolon apostrophe backslash
  leftshift 102nd z x c v b n m comma dot slash rightshift
  space
)

(deflayer home-row
  grave 1 2 3 4 5 6 7 8 9 0 minus equal
  tab q w e r t y u i o p leftbrace rightbrace
  ah sh dh fh g h jh kh lh smh apostrophe backslash
  leftshift 102nd z x c v b n m comma dot slash rightshift
  space
)
  '';

  # Systemd user service to run kmonad
  systemd.user.services.kmonad = {
    Unit = {
      Description = "KMonad for home row modifiers (AZERTY)";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.kmonad}/bin/kmonad ${kmonadConfig}";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
