{ config, pkgs, inputs, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name =  "catppuccin";
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

        git = {
          gitsigns.enable = true;
        };

        mini.pairs.enable = true;
        statusline.lualine.enable = true;
        telescope = {
          enable = true;
          extensions = [
            {
              name = "fzf";
              packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
              setup = {fzf = {fuzzy = true;};};
            }
          ];
        };
        
        autocomplete = {
          nvim-cmp.enable = true;
          blink-cmp.sourcePlugins.ripgrep.enable = true;
        };
        lsp = {
          enable = true;
          trouble = {
            enable = true;
          };
        };
        languages = {
          enableTreesitter = true;
          nix.enable = true;
          clang.enable = true;
          lua.enable = true;
        };

        diagnostics = {
          nvim-lint = {
            enable = true;
            lint_after_save = true;
            linters_by_ft = {
              python = [ "flake8" ];
              nix = [ "nixpkgs_fmt" "statix" ];
              c = [ "clangtidy" ];
            };
          };
        };

        lazy.plugins = {
          "vimplugin-ts-comments.nvim" = {
            package = pkgs.vimUtils.buildVimPlugin { 
            name = "ts-comments.nvim";
              src = pkgs.fetchFromGitHub {
                owner = "folke";
                repo = "ts-comments.nvim";
                rev = "main"; # or a specific tag/commit
                sha256 = "7uCJDt/w4q+Huoeh7wTjxicVp6+XWt8LHOXkgC5INDU="; 
              };
            };
            after = ''require("ts-comments")'';
            event = ["BufReadPost" "BufNewFile"];
          };
          "grug-far.nvim"= {
            package = pkgs.vimPlugins.grug-far-nvim;
            setupModule = "grug-far";
            cmd = [ "GrugFar" ];
            keys = [
              {
                key = "<leader>rr";
                action = ":GrugFar<CR>";
                mode = ["n"];
                desc = "GrugFar search";
              }
            ];
          };
        };
      };
    };
  };
  home.packages = with pkgs; [
    fzf
  ];
}
