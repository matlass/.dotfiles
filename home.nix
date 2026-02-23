{
  config,
  pkgs,
  inputs,
  paths,
  ...
}: {
  imports = [
    ./modules
  ];

  programs.home-manager = {
    enable = true;
  };

  home.username = "matthieu";
  home.homeDirectory = "/home/matthieu";
  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;
  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "xcb";
  };

  services.home-manager.autoUpgrade = {
    useFlake = true;
    flakeDir = paths.flakePath;
  };
  home.packages = with pkgs; [
    gnome-boxes
    qemu_kvm
    libvirt
    fprintd
    libfprint
    vim
    makedepend
    hyprlock
    swaynotificationcenter
    btop
    nautilus
    networkmanagerapplet
    unzip
    zip
    blueman
    playerctl
    pavucontrol
    brightnessctl
    libnotify
    hyprshot
    satty
    discord
    wofi
    python3
    protonup-ng
  ];
}
