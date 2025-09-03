{config, pkgs, inpute, ...}:

{
  programs.kmonad = {
    enable = true;
    config = ./home-row.kbd;
  };
}
