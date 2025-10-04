{
  config,
  pkgs,
  ...
}: {
  boot.kernelModules = ["uinput"];

  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  services.kanata = {
    enable = true;
    keyboards = {
      laptop = {
        devices = [
          "/dev/input/event0"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
            a s d f j k l ;
          )
          (defalias
            a (tap-hold 200 200 a lctl)
            s (tap-hold 200 200 s lalt)
            d (tap-hold 200 200 d lsft)
            f (tap-hold 200 200 f lmet)
            j (tap-hold 200 200 j rmet)
            k (tap-hold 200 200 k rsft)
            l (tap-hold 200 200 l ralt)
            ; (tap-hold 200 200 ; rctl)
          )
          (deflayer base
            @a @s @d @f @j @k @l @;
          )
        '';
      };
    };
  };

  systemd.services.kanata-laptop = {
    overrideStrategy = "asDropIn";
    serviceConfig = {
      DynamicUser = "no";
      PrivateUsers = "no";
      User = "matlass";
      Group = "users";
    };
  };
}
