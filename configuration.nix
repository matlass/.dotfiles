{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Bootloader
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  #Kernel parametre
  boot.kernelParams = [ "i915.enable_dpcd_backlight=3" ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd hyprland";
        user = "greeter";
      };
      initial_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd hyprland";
        user = "matthieu";
      };
    };
  };
  programs.kdeconnect.enable = true;
  security.polkit.enable = true;

  networking.hostName = "bok"; # Define your hostname.
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
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };
  
  # Enable upower
  services.upower.enable = true;
  # Enable power-profiles-daemon
  services.power-profiles-daemon.enable = true; 
  # Enable Zsh
  programs.zsh.enable = true;
  services.gvfs.enable = true;

  # Configure console keymap
  console.keyMap = "fr";

 # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.matthieu = {
    isNormalUser = true;
    description = "matthieu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    kitty
    hyprlock
    brave
    htop
    btop
    nautilus
    networkmanagerapplet
    unzip
    zip
    blueman
    playerctl
    pavucontrol
    brightnessctl
    neovim
    libnotify
    hyprshot
    beeper
    discord
    jetbrains.rider 
    wofi
    yazi
  ];

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
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk ];

  # Enable sound with pipewire.
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
    options = "--delet-older-that 2d";
  };

  # Automatic updating
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  system.stateVersion = "25.05"; # Did you read the comment?

}
