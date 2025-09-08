{ config, pkgs, inputs, paths, ...}:
{
  imports = [
    ./modules
  ];

  programs.home-manager = {
    enable = true;
  };

  home.username = "matthieu";
  home.homeDirectory = "/home/matthieu";
  home.stateVersion = "25.05";
  programs.zsh = {
    enable = true;
    shellAliases = {
      nrs = "${paths.nixosRebuildScript}";
      nru = "${paths.updateScript}";
      hrs = "${paths.homeManagerRebuildScript}";
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
  ];
}
