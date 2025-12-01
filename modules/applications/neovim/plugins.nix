{pkgs, ...}: {
  programs.nvf.settings.vim = {
    lazy.plugins = {
      # Enhanced comments with treesitter
      # "vimplugin-ts-comments.nvim" = {
      #   package = pkgs.vimUtils.buildVimPlugin {
      #     name = "ts-comments.nvim";
      #     src = pkgs.fetchFromGitHub {
      #       owner = "folke";
      #       repo = "ts-comments.nvim";
      #       rev = "main";
      #       sha256 = "7uCJDt/w4q+Huoeh7wTjxicVp6+XWt8LHOXkgC5INDU=";
      #     };
      #   };
      #   after = ''require("ts-comments")'';
      #   event = ["BufReadPost" "BufNewFile"];
      # };
      #

      "ts-comments.nvim" = {
        package = pkgs.vimUtils.buildVimPlugin {
          name = "ts-comments.nvim";
          src = builtins.fetchGit {
            url = "https://github. com/folke/ts-comments.nvim";
            ref = "main";
            allRefs = true;
          };
        };
        setupModule = "ts-comments";
        event = ["BufReadPost" "BufNewFile"];
      };
      # Advanced search and replace
      "grug-far.nvim" = {
        package = pkgs.vimPlugins.grug-far-nvim;
        setupModule = "grug-far";
        cmd = ["GrugFar"];
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
}
