{
  config,
  pkgs,
  ...
}: {
  # In your home-manager configuration
  programs.kanata = {
    enable = true;
    keyboards = {
      laptop = {
        devices = [
          # Add your keyboard device path here
          "/dev/input/by-id/your-keyboard-device"
        ];
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
}
