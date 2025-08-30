{ config, pkgs, inputs, ...}:

{
  imports = [
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/ecosystemhypr.nix
    ./modules/neovim.nix
  ];
  
  home.username = "matthieu";
  home.homeDirectory = "/home/matthieu";
  home.stateVersion = "25.05";
  programs.zsh = {
    enable = true;
    shellAliases = {
      nrs = "~/.config/nixos/modules/scripts/nixos-rebuild.zsh";
      nru = "~/.config/nixos/modules/scripts/update.zsh";
      hrs = "~/.config/nixos/modules/scripts/home-manager-rebuild.zsh";
      ls = "eza --icons=always --git --color=always";
    };
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "z"
        "sudo"
        "extract"
        "colored-man-pages"
      ];
    };
  };

  programs.git = {
    enable = true;
    userName = "matlass_";
    userEmail = "matthieu@thefau.com";
    extraConfig = {
      pull.rebase = false;
      init.defaultBranch = "main";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # xdg.desktopEntries.brave = {
  #   name = "Brave Browser";
  #   exec = "brave --ozone-platform=wayland %U";
  #   icon = "brave-browser";
  #   type = "Application";
  #   categories = [ "Network" "WebBrowser" ];
  #  };
  # programs.chromium = {
  #   enable = true;
  #   package = pkgs.brave;
  #   extensions = 
  # };
  programs.brave = {
    enable = true;
    extensions = [
      "nngceckbapebfimnlniiiahkmmgnoini" # Bitwarden
      "okadibdjfemhmcjkaemgkpjjdhfalhmm" # uBlock Origin Light
    ];
  };

  home.packages = with pkgs; [
    eza
    home-manager
  ];
}
