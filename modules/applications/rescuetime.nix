{
  config,
  pkgs,
  ...
}: {
  systemd.user.services.rescuetime = {
    Unit = {
      Description = "RescueTime time tracking service";
      After = ["graphical-session.target"];
      PartOf = ["graphical-session.target"];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.rescuetime}/bin/rescuetime";
      Restart = "on-failure";
      RestartSec = "5";

      # Environment variables to help with Wayland/X11 compatibility
      Environment = [
        "QT_QPA_PLATFORM=xcb"
        "GDK_BACKEND=x11"
      ];
    };

    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };

  home.packages = with pkgs; [
    rescuetime
  ];
}
