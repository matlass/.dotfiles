{ pkgs, ... }:

{
  programs.nvf.settings.vim = {
    filetree = {
      nvimTree = {
        enable = true;
        openOnSetup = false;
        hijackCursor = true;
        hijackUnnamedBufferWhenOpening = false;
        setupOpts = {
          update_focused_file = {
            enable = true;
            update_root = true;
          };
          renderer = {
            add_trailing = false;
            group_empty = false;
            highlight_git = true;
            root_folder_label = ":~:s?$?/..?";
            indent_width = 2;
            indent_markers = {
              enable = false;
              inline_arrows = true;
            };
            icons = {
              webdev_colors = true;
              git_placement = "before";
              padding = " ";
              symlink_arrow = " ➛ ";
              show = {
                file = true;
                folder = true;
                folder_arrow = true;
                git = true;
              };
            };
          };
          view = {
            width = 30;
            side = "left";
          };
        };
      };
    };
    
    # Add Oil.nvim for directory editing
    lazy.plugins."oil.nvim" = {
      package = pkgs.vimPlugins.oil-nvim;
      setupModule = "oil";
      setupOpts = {
        columns = ["icon"];
        keymaps = {
          "g?" = "actions.show_help";
          "<CR>" = "actions.select";
          "<C-s>" = "actions.select_vsplit";
          "<C-h>" = "actions.select_split";
          "<C-t>" = "actions.select_tab";
          "<C-p>" = "actions.preview";
          "<C-c>" = "actions.close";
          "<C-l>" = "actions.refresh";
          "-" = "actions.parent";
          "_" = "actions.open_cwd";
          "`" = "actions.cd";
          "~" = "actions.tcd";
          "gs" = "actions.change_sort";
          "gx" = "actions.open_external";
          "g." = "actions.toggle_hidden";
        };
        use_default_keymaps = true;
        view_options = {
          show_hidden = false;
        };
      };
    };
  };
}
