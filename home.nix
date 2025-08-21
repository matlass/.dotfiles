{ config, pkgs, ...}:

{
  imports = [
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/ecosystemhypr.nix
#    ./modules/neovim.nix
  ];
  
  home.username = "matthieu";
  home.homeDirectory = "/home/matthieu";
  home.stateVersion = "25.05";

  programs.zsh = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch -I nixos-config=$HOME/.config/nixos/configuration.nix";
      nru = "sudo nixos-rebuild switch -I nixos-config=$HOME/.config/nixos/configuration.nix --upgrade";
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

  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    extraConfig = "
    set relativenumber
    ";
  };


  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.desktopEntries.brave = {
    name = "Brave Browser";
    exec = "brave --ozone-platform=wayland %U";
    icon = "brave-browser";
    type = "Application";
    categories = [ "Network" "WebBrowser" ];
  };

  services.swaync = {
    enable = true;
  };
  home.packages = with pkgs; [
    eza 
  ];
}
