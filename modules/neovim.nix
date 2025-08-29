{ config, pkgs, inputs, ... }:

{
/*  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
            name = "onedark";
            src = inputs.plugin-onedark;
          };
        };
      })
    ];
  };
*/
  programs.neovim = 
  {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      lua-language-server
      ni 
      wl-clipboard
    ];
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    plugins = with pkgs.vimPlugins; [];
    /*extraLuaConfig = ''
      vim.g.mapleader = ' '
      vim.g.maplocalleader = ' '
      -- vim.o.clipboard = 'wl-clipboard'
      vim.o.number = true
      vim.o.relativenumber = true
      vim.o.signcolumn = 'yes'
      vim.o.tabstop = 4
      vim.o.shiftwidth = 4
      vim.o.updatetime = 300
      vim.o.termguicolors = true
      vim.o.mouse = 'a'
    '';*/
  };
}
