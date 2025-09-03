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
  input  (iokit-name)
  output (kext)

  ;; Comment this if you want unhandled events not to be emitted
  fallthrough true

  ;; Set this to false to disable any command-execution in KMonad
  allow-cmd true
)

;; lmet -> cmd
;; lalt -> option
;; fn   -> fn


(defalias
    sft_a (tap-hold-next-release 200 a lsft)
    alt_s (tap-hold-next-release 200 s lalt)
    ctl_d (tap-hold-next-release 200 d lctl)
    met_f (tap-hold-next-release 200 f lmet)

    met_j (tap-hold-next-release 200 j rmet)
    ctl_k (tap-hold-next-release 200 k rctl)
    alt_l (tap-hold-next-release 200 l lalt)
    sft_; (tap-hold-next-release 200 ; rsft)

    nav (layer-toggle nav)
    m_q (around lmet q)
    m_w (around lmet w)
    m_e (around lmet e)
    m_r (around lmet r)
    m_t (around lmet t)
    m_a (around lmet a)
    m_s (around lmet s)
    m_d (around lmet d)
    m_f (around lmet f)
    m_g (around lmet g)
    m_z (around lmet z)
    m_x (around lmet x)
    m_c (around lmet c)
    m_v (around lmet v)
    m_sp (around lmet space)

    sub (layer-toggle sublime)
    sm_sp (around lmet P)
)

(defsrc
  f10  f11  f12
  tab  q    w    e    r    t    u    i    o    p
  caps a    s    d    f    g    h    j    k    l    ;
  lsft z    x    c    v    b    n    m    ,    .    /
  fn lctl lalt lmet space
)

(deflayer qwerty
  mute vold volu
  tab  q    w    e    r    t    u    i    o    p
  lctrl @sft_a   @alt_s   @ctl_d   @met_f   g   h   @met_j   @ctl_k   @alt_l   @sft_;
  lsft  z    x    c    v    b    n    m    ,    .    /
  fn lctl lalt @nav space
)

(deflayer nav
  _ _ _
  tab   @m_q   @m_w   @m_e   @m_r    @m_t    {      }    \(    \)
  lctrl @m_a   @m_s   @m_d   @m_f    @m_g   left  down   up   right  ;
  @sub  @m_z   @m_x   @m_c   @m_v      b     n      [     ]     <    >
  fn lctl lalt @nav @m_sp
)

;; cmd-shift-p
(deflayer sublime
  _ _ _
  _     _      _      _      _       _      _     _      _    @sm_sp
  _     _      _      _      _       _      _     _      _       _       _
  _     _      _      _      _       _      _     _      _       _       _
  _     _      _      _      _
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
