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

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };
  home.packages = with pkgs; [
    keepassxc
  ];

  # Optional: Configure KeePassXC settings
  xdg.configFile."keepassxc/keepassxc.ini".text = ''
    [General]
    AutoSaveAfterEveryChange=true
    BackupBeforeSave=true

    [GUI]
    ShowTrayIcon=true
    MinimizeToTray=true

    [Security]
    LockDatabaseIdle=true
    LockDatabaseIdleSeconds=300

    [Browser]
    Enabled=false
  '';
}
