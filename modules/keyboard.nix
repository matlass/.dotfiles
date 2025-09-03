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

    (defsrc
      esc  & é " ' ( - è _ ç à ) =
      q s d f g h j k l m ù 
      w x c v b n , ; : !
      space
    )

    (deflayer home-row
      esc  & é " ' ( - è _ ç à ) =
      (tap-hold-next-release q lalt)
      (tap-hold-next-release s lmeta)
      (tap-hold-next-release d lctl)
      (tap-hold-next-release f lshift)
      g h
      (tap-hold-next-release j lalt)
      (tap-hold-next-release k lmeta)
      (tap-hold-next-release l lctl)
      (tap-hold-next-release m lshift)
      ù
      w x c v b n , ; : !
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
