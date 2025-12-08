{pkgs, ...}: {
  home.packages = with pkgs; [
    hyprpanel
  ];

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
      bar = {
        launcher.autoDetectIcon = true;
        workspaces.show_icons = true;
      };

      menus.dashboard = {
        directories.enabled = false;
        stats.enable_gpu = true;
      };
      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };
      theme = {
        font = {
          name = "CaskaydiaCove NF";
          size = "14px";
        };
        bar.transparent = true;
      };
    };
  };
}
