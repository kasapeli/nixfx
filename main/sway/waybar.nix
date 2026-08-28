{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        margin-top = 5;
        margin-left = 5;
        margin-right = 5;

        modules-left = [ "sway/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "memory"
          "pulseaudio"
          "battery"
        ];

        clock = {
          format = "{:%I:%M %p}";
        };

        memory = {
          interval = 30;
          format = "   {percentage}% ";
        };

        pulseaudio = {
          format = " {icon}  {volume}% ";
          format-muted = "   Muted ";
          format-icons = {
            "default" = [
              ""
              ""
              ""
            ];
          };
        };

        battery = {
          bat = "BAT0";
          interval = 30;
          format = "{icon}  {capacity}% ";
          format-charging = "{icon} 󱐋 {capacity}% ";
          format-plugged = " Plugged ";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];

        };

        style = ''
          * {
            font-family: "Monocraft";
            font-size: 16px;
          }
        '';
      };
    };
  };
}
