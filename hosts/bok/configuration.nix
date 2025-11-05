{
  config,
  pkgs,
  inputs,
  paths,
  ...
}: let
in {
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  #Kernel parametre
  boot.kernelParams = ["i915.enable_dpcd_backlight=3"];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd hyprland";
        user = "matthieu";
      };
      initial_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd hyprland";
        user = "matthieu";
      };
    };
  };

  services.fprintd.enable = true;
  security.pam.services = {
    login.fprintAuth = true;
    sudo.fprintAuth = true;
    greetd.fprintAuth = true;
  };

  environment.systemPackages = with pkgs; [
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
    beeper
    discord
    wofi
    yazi
    rapidraw
    python3
    protonup-ng
  ];

  programs.kdeconnect.enable = true;
  security.polkit.enable = true;

  networking.hostName = "bok";

  # Enable networking
  networking.networkmanager.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
    LC_MESSAGES = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  programs.zsh.enable = true;
  services.gvfs.enable = true;

  console.keyMap = "fr";

  users.users.matthieu = {
    isNormalUser = true;
    description = "matthieu";
    extraGroups = ["networkmanager" "wheel" "input" "uinput"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    inter
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    font-awesome
    material-design-icons
    nerd-fonts.noto
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
  ];

  programs.hyprland.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Delete generation from more that 7 days
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-that 2d";
  };

  # Automatic updating
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    flake = "${paths.dotfilesPath}#bok";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/root/compatibilitytools.d";
  };

  system.stateVersion = "25.05";
}
