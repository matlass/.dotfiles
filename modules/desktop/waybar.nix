{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-bottom = 0;
        spacing = 0;

        modules-left = ["hyprland/workspaces" "cpu"];
        modules-center = ["clock" "custom/media"];
        modules-right = ["bluetooth" "network" "pulseaudio" "backlight" "battery" "tray"];

        "hyprland/workspaces" = {
          format = "{name}: {icon}";
          format-icons = {
            active = "";
            default = "";
            "1" = "";
            "2" = "";
            "9" = "";
            "10" = "";
          };
        };

        "custom/media" = {
          format = "{icon}";
          return-type = "json";
          format-icons = {
            Playing = "";
            Paused = "";
            Stopped = "";
          };
          max-length = 50;
          exec = "${pkgs.writeShellScript "waybar-media" ''
            #!/bin/sh
            status=$(${pkgs. playerctl}/bin/playerctl status 2>/dev/null)

            if [ -z "$status" ] || [ "$status" = "Stopped" ]; then
              printf '{"text":"","class":"Stopped","alt":"Stopped"}\n'
              exit 0
            fi

            title=$(${pkgs.playerctl}/bin/playerctl metadata title 2>/dev/null || echo "No Title")
            artist=$(${pkgs.playerctl}/bin/playerctl metadata artist 2>/dev/null || echo "Unknown Artist")

            # Escape special characters for JSON
            title=$(echo "$title" | sed 's/"/\\"/g' | sed "s/'/\\'/g")
            artist=$(echo "$artist" | sed 's/"/\\"/g' | sed "s/'/\\'/g")

            printf '{"text":"%s - %s","class":"%s","alt":"%s","tooltip":"%s - %s"}\n' \
              "$title" "$artist" "$status" "$status" "$title" "$artist"
          ''}";
          interval = 2;
          on-click = "${pkgs.writeShellScript "toggle-music-popup" ''
            #!/bin/sh
            if pgrep -x eww > /dev/null; then
              if ${pkgs.eww}/bin/eww windows | grep -q "\*music-popup"; then
                ${pkgs.eww}/bin/eww close music-popup
              else
                ${pkgs.eww}/bin/eww open music-popup
              fi
            else
              echo "eww is not running"
            fi
          ''}";
          on-click-right = "${pkgs.playerctl}/bin/playerctl next";
          on-click-middle = "${pkgs.playerctl}/bin/playerctl previous";
        };
        bluetooth = {
          format = "󰂲";
          format-on = "{icon}";
          format-off = "{icon}";
          format-connected = "{icon}";
          format-icons = {
            on = "󰂯";
            off = "󰂲";
            connected = "󰂱";
          };
          on-click = "blueman-manager";
          tooltip-format-connected = "{device_enumerate}";
        };

        clock = {
          timezone = "Europe/Paris";
          tooltip = false;
          format = "{:%H:%M:%S  -  %A, %d}";
          interval = 1;
        };

        network = {
          format-wifi = "󰤢";
          format-ethernet = "󰈀 ";
          format-disconnected = "󰤠 ";
          interval = 5;
          tooltip-format = "{essid} ({signalStrength}%)";
          on-click = "nm-connection-editor";
        };

        cpu = {
          interval = 1;
          format = "  {icon0}{icon1}{icon2}{icon3} {usage:>2}%";
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          on-click = "kitty -e btop";
        };

        backlight = {
          format = "{icon}  {percent}%";
          format-icons = ["" "󰃜" "󰃛" "󰃞" "󰃝" "󰃟" "󰃠"];
          tooltip = false;
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "";
          format-icons = {
            default = ["" "" " "];
          };
          on-click = "pavucontrol";
        };

        battery = {
          interval = 2;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-full = "{icon}  {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = ["" "" "" "" ""];
        };

        "custom/lock" = {
          tooltip = false;
          on-click = "sh -c '(sleep 0s; hyprlock)' & disown";
          format = "";
        };
      };
    };

    style = ''
            /* --- Global Styles --- */
      * {
        font-family: 'SF Pro Text', 'Inter', 'Segoe UI, NotoSans Nerd Font', sans-serif;
        font-size: 13px;
        min-height: 0;
        padding-right: 0px;
        padding-left: 0px;
        padding-bottom: 0px;
      }

      /* --- Waybar Container --- */
      #waybar {
        background: transparent;
        color: #c6d0f5;
        margin: 0px;
        font-weight: 500;
      }

      /* --- Left Modules (Individual, Fully Rounded Blocks - With Horizontal Spacing & Simple Hover) --- */
      #memory,
      #workspaces,
      #custom-uptime,
      #cpu {
        background-color: #1a1b26;
        padding: 0.3rem 0.7rem;
        margin: 5px 0px; /* 5px top/bottom margin, 0px left/right (base for individual control) */
        border-radius: 6px; /* These modules are always rounded */
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        min-width: 0;
        border: none;
        /* Transition for background-color and color only */
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
      }

      #workspaces {
        padding: 2px;
        margin-left: 7px; /* Margin from the far left edge */
        margin-right: 5px; /* Spacing after the workspaces module */
      }
      #cpu,
      #custom-uptime {
        margin-right: 5px; /* Spacing after the uptime module */
      }

      /* Simple Hover effects for individual left modules - BRIGHTER COLOR */
      #custom-uptime:hover,
      #cpu:hover {
        background-color: rgb(41, 42, 53); /* Brighter highlight */
      }

      #workspaces button {
        color: #babbf1;
        border-radius: 5px; /* Workspaces buttons are always rounded */
        padding: 0.3rem 0.6rem;
        background: transparent;
        transition: all 0.2s ease-in-out;
        border: none;
        outline: none;
      }

      #workspaces button.active {
        color: #99d1db;
        background-color: rgba(153, 209, 219, 0.1);
        box-shadow: inset 0 0 0 1px rgba(153, 209, 219, 0.2);
      }

      #workspaces button:hover {
        background: rgb(41, 42, 53); /* Reference bright hover color */
        color: #c6d0f5;
      }

      /* --- Center Module (Individual, Fully Rounded Block - With Simple Hover) --- */
      #clock {
        background-color: #1a1b26;
        padding: 0.3rem 0.7rem;
        margin: 5px 0px;
        border-radius: 6px; /* This module is always rounded */
        box-shadow: 0 1px 3px rgba(153, 209, 219, 0.2);
        min-width: 0;
        border: none;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
      }

      /* Simple Hover effect for clock module - BRIGHTER COLOR */
      #clock:hover {
        background-color: rgba(153, 209, 219, 0.1); /* Brighter highlight */
      }

      #custom-media {
        background-color: #1a1b26;
        padding: 0.3rem 0.7rem;
        margin: 5px 5px 5px 0px;
        border-radius: 6px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        min-width: 0;
        border: none;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
        color: #babbf1;
        font-size: 14px;
      }

      #custom-media:hover {
        background-color: rgb(41, 42, 53);
      }

      #custom-media.Playing {
        color: #a6d189;
      }

      #custom-media.Paused {
        color: #e78284;
      }

      #custom-media.Stopped {
        color: #585b70;
      }

      /* --- Right Modules (Single, Seamless Bar ) --- */
      #bluetooth,
      #pulseaudio,
      #backlight,
      #network,
      #custom-lock,
      #battery {
        background-color: #1a1b26;
        padding: 0.3rem 0.7rem;
        margin: 5px 0px;
        border-radius: 0;
        box-shadow: none;
        min-width: 0;
        border: none;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
      }

      #bluetooth:hover,
      #pulseaudio:hover,
      #backlight:hover,
      #network:hover,
      #custom-lock:hover,
      #battery:hover {
        background-color: rgb(41, 42, 53);
      }


      #bluetooth {
        margin-left: 0px;
        border-top-left-radius: 6px;
        border-bottom-left-radius: 6px;
      }

      #battery {
        border-top-right-radius: 6px;
        border-bottom-right-radius: 6px;
        margin-right: 7px;
      }

      #custom-uptime {
        color: #babbf1;
      }
      #cpu {
        color: #c6d0f5;
      }

      #clock {
        color: #99d1db;
        font-weight: 500;
      }

      #pulseaudio {
        color: #c6d0f5;
      }
      #backlight {
        color: #c6d0f5;
      }

      #network {
        color: #c6d0f5;
      }

      #network.disconnected {
        color: #e78284;
      }

      #custom-lock {
        color: #babbf1;
      }
      #bluetooth {
        color: #888888;
        font-size: 16px;
      }
      #bluetooth.on {
        color: #2196f3;
      }
      #bluetooth.connected {
        color: #99d1db;
      }
      #battery {
        color: #99d1db;;
      }
      #battery.charging {
        color: #a6d189;
      }
      #battery.warning:not(.charging) {
        color: #e78284;
      }

      /* --- Tooltip Styles --- */
      tooltip {
        background-color: #1a1b26;
        color: #dddddd;
        padding: 5px 12px;
        margin: 5px 0px;
        border-radius: 6px;
        border: 1px solid rgba(255, 255, 255, 0.1);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        font-size: 12px;
      }
    '';
  };
}
