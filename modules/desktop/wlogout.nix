{config, pkgs, paths, ...}:
let
  iconsDir = "${paths.iconsPath}";
in
{
  #Wlogout config
  programs.wlogout = {
    enable = true;
    style = ''
      * {
	  background-image: none;
	  box-shadow: none;
        }

      window {
	background-color: rgba(0, 0, 0, 0.9);
      }

      button {
        border-radius: 0;
        border-color: black;
	  text-decoration-color: #FFFFFF;
        color: #FFFFFF;
  	  background-color: #1E1E1E;
	  border-style: solid;
	  border-width: 1px;
	  background-repeat: no-repeat;
	  background-position: center;
	  background-size: 25%;
      }

      button:focus, button:active, button:hover {
	background-color: #3700B3;
	outline-style: none;
      }

      #lock {
        background-image: image(url("${iconsDir}/lock.png"), url("${iconsDir}/lock.png"));
      }

      #logout {
         background-image: image(url("${iconsDir}/logout.png"), url("${iconsDir}/logout.png"));
      }

      #suspend {
        background-image: image(url("${iconsDir}/suspend.png"), url("${iconsDir}/suspend.png"));
      }

      #hibernate {
        background-image: image(url("${iconsDir}/hibernate.png"), url("${iconsDir}/hibernate.png"));
      }

      #shutdown {
        background-image: image(url("${iconsDir}/shutdown.png"), url("${iconsDir}/shutdown.png"));
      }

      #reboot {
        background-image: image(url("${iconsDir}/reboot.png"), url("${iconsDir}/reboot.png"));
      }
    '';

    layout = [
      {
        "label" = "lock";
        "action" = "hyprlock";
        "text" = "Lock";
        "keybind" = "l";
      }
      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }
      {
        "label" = "logout";
        "action" = "loginctl terminate-user $USER";
        "text" = "Logout";
        "keybind" = "e";
      }
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Shutdown";
        "keybind" = "s";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Suspend";
        "keybind" = "u";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      } 
    ];
  };
}