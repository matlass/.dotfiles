{ config, pkgs, ... }:

{
  programs.eww = {
    enable = true;
    configDir = ./eww;
  };

  home.packages = with pkgs; [
    playerctl
    jq
  ];

  # Create the eww configuration files
  home.file.".config/eww/eww.yuck".text = ''
    (defwindow music-popup
      :monitor 0
      :geometry (geometry :x "0%"
                          :y "50px"
                          :width "450px"
                          :height "150px"
                          :anchor "top right")
      :stacking "overlay"
      :exclusive false
      :focusable false
      (music-widget))

    (defwidget music-widget []
      (box :class "music-container"
           :orientation "h"
           :space-evenly false
        (box :class "album-art"
             :style "background-image: url('${music-art}');")
        (box :class "music-info"
             :orientation "v"
             :space-evenly false
             :spacing 10
          (box :orientation "v" :space-evenly false :spacing 5
            (label :class "music-title" :text music-title :limit-width 30 :halign "start")
            (label :class "music-artist" :text music-artist :limit-width 30 :halign "start"))
          (box :class "music-progress" :orientation "v" :space-evenly false
            (scale :class "progress-bar"
                   :value music-position
                   :min 0
                   :max 101
                   :onchange "playerctl position $(echo {}*${music-length}/100 | bc -l)")
            (box :class "music-times" :orientation "h" :halign "center"
              (label :text music-position-time :halign "start")
              (label :text music-length-time :halign "end")))
          (box :class "music-controls" :orientation "h" :halign "center" :spacing 15
            (button :class "music-btn" :onclick "playerctl previous" "")
            (button :class "music-btn play-pause" :onclick "playerctl play-pause" 
                    "${music-status == 'Playing' ? '' : ''}")
            (button :class "music-btn" :onclick "playerctl next" "")))))

    (defpoll music-title :interval "1s"
      "playerctl metadata title 2>/dev/null || echo 'No Music Playing'")
    
    (defpoll music-artist :interval "1s"
      "playerctl metadata artist 2>/dev/null || echo 'Unknown Artist'")
    
    (defpoll music-art :interval "1s"
      "playerctl metadata mpris:artUrl 2>/dev/null | sed 's|file://||' || echo '/tmp/default-album. png'")
    
    (defpoll music-status :interval "1s"
      "playerctl status 2>/dev/null || echo 'Stopped'")
    
    (defpoll music-position :interval "1s"
      "playerctl metadata --format '{{ duration(position) }}' 2>/dev/null | awk -F: '{ print ($1 * 60) + $2 }' || echo '0'")
    
    (defpoll music-length :interval "1s"
      "playerctl metadata --format '{{ duration(mpris:length) }}' 2>/dev/null | awk -F: '{ print ($1 * 60) + $2 }' || echo '100'")
    
    (defpoll music-position-time :interval "1s"
      "playerctl metadata --format '{{ duration(position) }}' 2>/dev/null || echo '0:00'")
    
    (defpoll music-length-time :interval "1s"
      "playerctl metadata --format '{{ duration(mpris:length) }}' 2>/dev/null || echo '0:00'")
  '';

  home.file.".config/eww/eww.scss".text = ''
    * {
      all: unset;
      font-family: "SF Pro Text", "Inter", sans-serif;
    }

    .music-container {
      background-color: #1a1b26;
      border-radius: 12px;
      padding: 15px;
      margin: 10px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
    }

    .album-art {
      min-width: 120px;
      min-height: 120px;
      background-size: cover;
      background-position: center;
      border-radius: 8px;
      margin-right: 15px;
    }

    .music-info {
      min-width: 280px;
    }

    .music-title {
      font-size: 16px;
      font-weight: 600;
      color: #c6d0f5;
    }

    .music-artist {
      font-size: 13px;
      color: #babbf1;
    }

    .music-progress {
      margin-top: 10px;
    }

    .progress-bar {
      min-height: 4px;
      background-color: #2a2b36;
      border-radius: 2px;
    }

    .progress-bar trough {
      min-height: 4px;
      background-color: #2a2b36;
      border-radius: 2px;
    }

    .progress-bar progress {
      min-height: 4px;
      background-color: #99d1db;
      border-radius: 2px;
    }

    .music-times {
      margin-top: 5px;
      font-size: 11px;
      color: #838ba7;
    }

    . music-times label {
      margin: 0 5px;
    }

    .music-controls {
      margin-top: 10px;
    }

    .music-btn {
      font-size: 20px;
      color: #c6d0f5;
      background-color: #2a2b36;
      border-radius: 50%;
      padding: 8px 12px;
      transition: all 0.2s ease-in-out;
    }

    .music-btn:hover {
      background-color: #3a3b46;
      color: #99d1db;
    }

    .music-btn. play-pause {
      font-size: 24px;
      background-color: #99d1db;
      color: #1a1b26;
      padding: 10px 14px;
    }

    .music-btn. play-pause:hover {
      background-color: #a9e1ea;
    }
  '';
}
