{ pkgs, ... }:

{
  programs.nvf.settings.vim = {
    lazy.plugins = {
      # Harpoon for quick file navigation
      "harpoon" = {
        package = pkgs.vimPlugins.harpoon;
        setupModule = "harpoon";
        setupOpts = {
          global_settings = {
            save_on_toggle = false;
            save_on_change = true;
            enter_on_sendcmd = false;
            tmux_autoclose_windows = false;
            excluded_filetypes = ["harpoon"];
            mark_branch = false;
          };
        };
        event = ["BufReadPost" "BufNewFile"];
      };
      
      # Which-key for shortcut popup
      "which-key.nvim" = {
        package = pkgs.vimPlugins.which-key-nvim;
        setupModule = "which-key";
        setupOpts = {
          plugins = {
            marks = true;
            registers = true;
            spelling = {
              enabled = true;
              suggestions = 20;
            };
            presets = {
              operators = false;
              motions = true;
              text_objects = true;
              windows = true;
              nav = true;
              z = true;
              g = true;
            };
          };
          window = {
            border = "rounded";
            position = "bottom";
            margin = [ 1 0 1 0 ];
            padding = [ 2 2 2 2 ];
            winblend = 0;
          };
          layout = {
            height = { min = 4; max = 25; };
            width = { min = 20; max = 50; };
            spacing = 3;
            align = "left";
          };
          ignore_missing = true;
          hidden = [ "<silent>" "<cmd>" "<Cmd>" "<CR>" "call" "lua" "^:" "^ " ];
          show_help = true;
          triggers = "auto";
          triggers_blacklist = {
            i = ["j" "k"];
            v = ["j" "k"];
          };
        };
        event = "VeryLazy";
        after = ''
          local wk = require("which-key")
          wk.register({
            ["<leader>f"] = { name = "+find" },
            ["<leader>b"] = { name = "+buffer" },
            ["<leader>c"] = { name = "+code" },
            ["<leader>r"] = { name = "+replace" },
            ["<leader>x"] = { name = "+diagnostics" },
            ["<leader>g"] = { name = "+git" },
          })
        '';
      };
    };
  };
}
