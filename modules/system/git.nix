{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "matlass_";
    userEmail = "matthieu@thefau.com";
    extraConfig = {
      pull.rebase = false;
      include.path = "~/.config/.gitconfig-private";
    };
  };
}
