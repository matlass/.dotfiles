{config,pkgs, ...}:
let
  iconsDir = "/etc/nixos/modules/icons";
in
{

  #Hyprpaper config

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = [
        "$HOME/.config/nixos/modules/images/nix-dark.png"
      ];
      wallpaper = [
        ",$HOME/.config/nixos/modules/images/nix-dark.png"
      ];
    };
  };

  #Hypridle config
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
	on_unlock_cmd = "notify-send 'Welcome back'";
      }; 

      listener = [
      {
        timeout = 230;
	on-timeout = "brightnessctl -s set 10";
	on-resume = "brightnessctl -r";
      }
      {
        timout = 300;
        on-timeout = "loginctl lock-session";
      }
      {
        timout = 600;
	on-timeout = "systemctl suspend";
      }
      ];
    };
  };

  #Wofi config
  programs.wofi = {
    enable = true;
      # style = ''
      #   @define-color	rosewater  #f5e0dc;
      #   @define-color	rosewater-rgb  rgb(245, 224, 220);
      #   @define-color	flamingo  #f2cdcd;
      #   @define-color	flamingo-rgb  rgb(242, 205, 205);
      #   @define-color	pink  #f5c2e7;
      #   @define-color	pink-rgb  rgb(245, 194, 231);
      #   @define-color	mauve  #cba6f7;
      #   @define-color	mauve-rgb  rgb(203, 166, 247);
      #   @define-color	red  #f38ba8;
      #   @define-color	red-rgb  rgb(243, 139, 168);
      #   @define-color	maroon  #eba0ac;
      #   @define-color	maroon-rgb  rgb(235, 160, 172);
      #   @define-color	peach  #fab387;
      #   @define-color	peach-rgb  rgb(250, 179, 135);
      #   @define-color	yellow  #f9e2af;
      #   @define-color	yellow-rgb  rgb(249, 226, 175);
      #   @define-color	green  #a6e3a1;
      #   @define-color	green-rgb  rgb(166, 227, 161);
      #   @define-color	teal  #94e2d5;
      #   @define-color	teal-rgb  rgb(148, 226, 213);
      #   @define-color	sky  #89dceb;
      #   @define-color	sky-rgb  rgb(137, 220, 235);
      #   @define-color	sapphire  #74c7ec;
      #   @define-color	sapphire-rgb  rgb(116, 199, 236);
      #   @define-color	blue  #89b4fa;
      #   @define-color	blue-rgb  rgb(137, 180, 250);
      #   @define-color	lavender  #b4befe;
      #   @define-color	lavender-rgb  rgb(180, 190, 254);
      #   @define-color	text  #cdd6f4;
      #   @define-color	text-rgb  rgb(205, 214, 244);
      #   @define-color	subtext1  #bac2de;
      #   @define-color	subtext1-rgb  rgb(186, 194, 222);
      #   @define-color	subtext0  #a6adc8;
      #   @define-color	subtext0-rgb  rgb(166, 173, 200);
      #   @define-color	overlay2  #9399b2;
      #   @define-color	overlay2-rgb  rgb(147, 153, 178);
      #   @define-color	overlay1  #7f849c;
      #   @define-color	overlay1-rgb  rgb(127, 132, 156);
      #   @define-color	overlay0  #6c7086;
      #   @define-color	overlay0-rgb  rgb(108, 112, 134);
      #   @define-color	surface2  #585b70;
      #   @define-color	surface2-rgb  rgb(88, 91, 112);
      #   @define-color	surface1  #45475a;
      #   @define-color	surface1-rgb  rgb(69, 71, 90);
      #   @define-color	surface0  #313244;
      #   @define-color	surface0-rgb  rgb(49, 50, 68);
      #   @define-color	base  #1e1e2e;
      #   @define-color	base-rgb  rgb(30, 30, 46);
      #   @define-color	mantle  #181825;
      #   @define-color	mantle-rgb  rgb(24, 24, 37);
      #   @define-color	crust  #11111b;
      #   @define-color	crust-rgb  rgb(17, 17, 27);
      #
      #   * {
      #     font-family: 'CaskaydiaCove Nerd Font', monospace;
      #     font-size: 18px;
      #   }
      #
      #   #window {
      #     margin: 0px;
      #     padding: 10px;
      #     border: 2px solid @lavender;
      #     border-radius: 8px;
      #     background-color: @base;
      #   }
      #
      #   #inner-box {
      #     margin: 5px;
      #     padding: 10px;
      #     border: none;
      #     background-color: @base;
      #   }
      #
      #   #outer-box {
      #     margin: 5px;
      #     padding: 10px;
      #     border: none;
      #     background-color: @base;
      #   }
      #
      #   #scroll {
      #     margin: 0px;
      #     padding: 10px;
      #     border: none;
      #     background-color: @base;
      #   }
      #
      #   #input {
      #     margin: 5px 20px;
      #     padding: 10px;
      #     border: none;
      #     border-radius: 0.1em;
      #     color: @text;
      #     background-color: @base;
      #   }
      #
      #   #input image {
      #       border: none;
      #       color: @red;
      #   }
      #
      #   #input * {
      #     outline: 4px solid @red!important;
      #   }
      #
      #   #text {
      #     margin: 5px;
      #     border: none;
      #     color: @text;
      #   }
      #
      #   #entry {
      #     background-color: @base;
      #   }
      #
      #   #entry arrow {
      #     border: none;
      #     color: @lavender;
      #   }
      #
      #   #entry:selected {
      #     border: 0.11em solid @lavender;
      #   }
      #
      #   #entry:selected #text {
      #     color: @mauve;
      #   }
      #
      #   #entry:drop(active) {
      #     background-color: @lavender!important;
      #   }
      # '';
    style = ''
      * {
    font-family: "JetBrainsMono Nerd Font", monospace;
    font-size: 16px;
    font-weight: bold;
}

window {
    margin: 0px;
    border: 2px solid #414868;
    border-radius: 5px;
    background-color: #24283b;
    font-family: monospace;
    font-size: 12px;
}

#input {
    margin: 5px;
    border: 1px solid #24283b;
    color: #c0caf5;
    background-color: #24283b;
}

#input image {
    color: #c0caf5;
}

#inner-box {
    margin: 5px;
    border: none;
    background-color: #24283b;
}

#outer-box {
    margin: 5px;
    border: none;
    background-color: #24283b;
}

#scroll {
    margin: 0px;
    border: none;
}

#text {
    margin: 5px;
    border: none;
    color: #c0caf5;
}

#entry:selected {
    background-color: #414868;
    font-weight: normal;
}

#text:selected {
    background-color: #414868;
    font-weight: normal;
}
    '';
  };

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
 
  #Hyprlock config

  xdg.configFile."hypr/hyprlock.conf".text = ''
    # Sourcing colors generated by wallust
    $dScripts = $HOME/.config/hypr/scripts

    general {
        grace = 1
        fractional_scaling = 2
        immediate_render = true
    }

    background {
        monitor =
        path = ~/.config/nixos/modules/images/nixos_ascii_wallpapaer.jpg 

        color = rgb(0,0,0) # color will be rendered initially until path is available

        blur_size = 3
        blur_passes = 2 # 0 disables blurring
        noise = 0.0117
        contrast = 1.3000 # Vibrant!!!
        brightness = 0.8000
        vibrancy = 0.2100
        vibrancy_darkness = 0.0
    }

    # Date
    label {
        monitor =
        text = cmd[update:18000000] echo "<b> "$(date +'%A, %-d %B')" </b>"
        color = rgb(878787)
        font_size = 16
        font_family = Victor Mono Bold Italic
        position = 0, -120
        halign = center
        valign = center
    }

    # Hour-Time
    label {
        monitor =
        text = cmd[update:1000] echo "$(date +"%H")"
        color = rgb(878787)
        font_size = 200
        font_family = JetBrainsMono Nerd Font ExtraBold 
        position = 0, -60
        halign = center
        valign = top
    }

    # Minute-Time
    label {
        monitor =
        text = cmd[update:1000] echo "$(date +"%M")"
        color = rgb(797979)
        font_size = 200
        font_family = JetBrainsMono Nerd Font ExtraBold
        position = 0, -340
        halign = center
        valign = top
    }

    # Seconds-Time
    label {
        monitor =
        text = cmd[update:1000] echo "$(date +"%S")"
        color = rgb(6C6C6C)
        font_size = 35
        font_family = JetBrainsMono Nerd Font ExtraBold
        position = 0, -350
        halign = center
        valign = top
    }


    # USER
    label {
        monitor =
        text =   $USER
        color = rgb(878787)
        font_size = 24
        font_family = Victor Mono Bold Oblique
        position = 0, 220
        halign = center
        valign = bottom
    }

    # INPUT FIELD
    input-field {
        monitor =
        size = 200, 60
        outline_thickness = 2
        dots_size = 0.2
        dots_spacing = 0.2
        dots_center = true
        outer_color = rgb(6C6C6C)
        inner_color = rgba(255, 255, 255, 0.1)
        capslock_color = rgb(255,255,255)
        font_color = rgb(878787)
        fade_on_empty = false
        font_family = Victor Mono Bold Oblique
        placeholder_text = <i><span foreground="##ffffff99">🔒 Type Password</span></i>
        hide_input = false
        position = 0, 100
        halign = center
        valign = bottom
    }

    # Keyboard LAYOUT
    label {
        monitor =
        text = $LAYOUT
        color = rgb(878787)
        font_size = 10
        font_family = Victor Mono Bold Oblique
        position = 0, 70
        halign = center
        valign = bottom
    }

    # weather
    label {
        monitor =
        text = cmd[update:3600000] [ -f "$HOME/.cache/.weather_cache" ] && cat "$HOME/.cache/.weather_cache"
        color = rgb(878787)
        font_size = 16
        font_family = Victor Mono Bold Oblique
        position = 50, 0
        halign = left
        valign = bottom
    }
  '';

  home.packages = with pkgs; [
  ];

}
