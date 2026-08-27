{ config, pkgs, ... }:

{
  home.username = "sam";
  home.homeDirectory = "/home/sam";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fastfetch
  ];

  programs.git = {
    enable = true;
    userName = "kasapeli";
    userEmail = "yanratanaksambath@gmail.com";
  };

  programs.home-manager.enable = true;
}

