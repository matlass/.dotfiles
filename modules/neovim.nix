{ config, pkgs, ... }:
let
in
{
  imports = [ inputs.nvf.homeManagerModules.default ];
  
  programs.nvf = {
    enable = true;
  };
}
