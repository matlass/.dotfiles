{...}: {
  programs.hyprpanel = {
    enable = true;
    settings = {
      layout = {
        bar.layouts = {
          "0" = {
            left = [
              "dashboard"
              "workspaces"
              "windowtitle"
            ];
            middle = [
              "media"
              "clock"
            ];
            right = [
              "volume"
              "network"
              "bluetooth"
              "battery"
              "notifications"
            ];
          };
        };
      };
      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;

      menus = {
        dashboard = {
          directories.enabled = false;
          stats.enable_gpu = true;
        };
        clock = {
          time = {
            military = true;
            hideSeconds = true;
          };
        };
      };
      theme.font = {
        name = "CaskaydiaCove NF";
        size = "12px";
      };
    };
  };
}
