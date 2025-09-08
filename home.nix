{ config, pkgs, inputs, ...}:

{
  imports = [
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/ecosystemhypr.nix
    ./modules/neovim.nix
    ./modules/kitty.nix
  ];
  
  home.username = "matthieu";
  home.homeDirectory = "/home/matthieu";
  home.stateVersion = "25.05";
  programs.zsh = {
    enable = true;
    shellAliases = {
      nrs = "~/.config/nixos/modules/scripts/nixos-rebuild.sh";
      nru = "~/.config/nixos/modules/scripts/update.sh";
      hrs = "~/.config/nixos/modules/scripts/home-manager-rebuild.sh";
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
    extraConfig = {
      pull.rebase = false;
      init.defaultBranch = "main";
      include.path ="~/.config/.gitconfig-private";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };

  programs.brave = {
    enable = true;
    extensions = [
      "nngceckbapebfimnlniiiahkmmgnoini" # Bitwarden
      "okadibdjfemhmcjkaemgkpjjdhfalhmm" # uBlock Origin Light
      "clngdbkpkpeebahjckkjfobafhncgmne" # Stylus
    ];
  };

  home.packages = with pkgs; [
    eza
    home-manager
  ];
}
