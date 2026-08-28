{ pkgs, ... }:

{
  home.packages = with pkgs; [
    sway-contrib.grimshot
    wl-clipboard
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;

    extraConfig = ''
      corner_radius 8

      blur enable
      blur_xray disable
      blur_passes 3
      blur_radius 5

      default_dim_inactive 0.15    
    '';

    config = {
      modifier = "Mod4";
      terminal = "foot";

      window = {
        border = 0;
        titlebar = false;
      };

      floating = {
        border = 0;
        titlebar = false;
      };

      gaps = {
        inner = 2;
        outer = 4;
      };

      keybindings =
        let
          modifier = "Mod4";
        in
        {
          "${modifier}+Grave" = "exec foot";
          "${modifier}+q" = "kill";

          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "workspace number 6";
          "${modifier}+7" = "workspace number 7";
          "${modifier}+8" = "workspace number 8";
          "${modifier}+9" = "workspace number 9";

          "${modifier}+Shift+1" = "move container to workspace number 1";
          "${modifier}+Shift+2" = "move container to workspace number 2";
          "${modifier}+Shift+3" = "move container to workspace number 3";
          "${modifier}+Shift+4" = "move container to workspace number 4";
          "${modifier}+Shift+5" = "move container to workspace number 5";
          "${modifier}+Shift+6" = "move container to workspace number 6";
          "${modifier}+Shift+7" = "move container to workspace number 7";
          "${modifier}+Shift+8" = "move container to workspace number 8";
          "${modifier}+Shift+9" = "move container to workspace number 9";

          "${modifier}+d" = "exec rofi -show drun";
          "Print" = "exec grimshot copy area";

          "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

      startup = [
        { command = "waybar"; }
        { command = "mako"; }
      ];

      bars = [ ];
    };
  };

  services.mako.enable = true;
  programs.foot.enable = true;
  programs.rofi.enable = true;
}
