{config, pkgs, inpute, ...}:

{
  services.kmonad = {
    enable = true;
    config = ./home-row.kbd;
  };
}
