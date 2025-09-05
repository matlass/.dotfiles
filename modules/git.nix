{config, pkgs, ... }:
let
in
{
  programs.git = {
    userName = "matlass_";
    userEmail = "matthieu@thefau.com";
  };
}
