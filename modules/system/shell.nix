{
  config,
  pkgs,
  paths,
  ...
}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      nrs = "${paths.nixosRebuildScript}";
      nru = "${paths.updateScript}";
      hrs = "${paths.homeManagerRebuildScript}";
      ls = "eza --icons=always --git --color=always";
      ns = "nix-shell -p ";
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

  home.packages = with pkgs; [
    eza
    tree
    makedepend
  ];
}
