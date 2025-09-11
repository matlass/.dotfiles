{ pkgs, ... }:

{
  programs.nvf.settings.vim = {
    filetree = {
      nvimTree = {
        enable = true;
        openOnSetup = false;
        hijackCursor = true;
        hijackUnnamedBufferWhenOpening = false;
        updateFocusedFile = {
          enable = true;
          updateRoot = true;
        };
        view = {
          width = 30;
          side = "left";
        };
        renderer = {
          addTrailing = false;
          groupEmpty = false;
          highlightGit = true;
          rootFolderLabel = ":~:s?$?/..?";
          indentWidth = 2;
          indentMarkers = {
            enable = false;
            inlineArrows = true;
          };
          icons = {
            webdevColors = true;
            gitPlacement = "before";
            padding = " ";
            symlinkArrow = " ➛ ";
            show = {
              file = true;
              folder = true;
              folderArrow = true;
              git = true;
            };
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
