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
  programs.neovim = {
    enable = true;
    /*viAlias = true;
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
      vim.cmd("set expandtab")
      vim.cmd("set softtabstop=2")
      vim.g.mapleader = ' '
      vim.g.maplocalleader = ' '
      vim.o.number = true
      vim.o.relativenumber = true
      vim.o.signcolumn = 'yes'
      vim.o.tabstop = 2
      vim.o.shiftwidth = 2
      vim.o.updatetime = 300
    '';*/
  };
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };
        viAlias = true;
        vimAlias = true;
        withNodeJs = true;
        withPython3 = true;
        withRuby = true;
        globals = {
          mapleader = " ";
          maplocalleader = " ";
        };
        lineNumberMode = "relNumber";
        options = {
          tabstop = 2;
          shiftwidth = 2;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        languages = {
          enableLSP = true;
          enableTreesitter = true;
          
          nix.enable = true;
          clang.enable = true;
          lua.enable = true;
      };
    };
  };
}
