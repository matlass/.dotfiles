{pkgs, ...}:
{
  systemd.user.services.upower-notify = {
    Unit = {
      Description = "Battery notification daemon";
    };
    Service = {
      ExecStart = "${pkgs.upower-notify}/bin/upower-notify";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  home.packages = with pkgs; [
    upower-notify
  ];
}
