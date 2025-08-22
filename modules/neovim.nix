{ config, pkgs, ... }:
let
in
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
      vim.opt.relativenumber = true
      vim.opt.number = true
    '';
  };
}
