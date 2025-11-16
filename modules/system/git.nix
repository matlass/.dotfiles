{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "matlass_";
        email = "matthieu@thefau.com";
      };
      pull.rebase = false;
      include.path = "~/.config/.gitconfig-private";
    };
  };
}
