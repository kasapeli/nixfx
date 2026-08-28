{ pkgs, ... }:

{
  home.username = "sam";
  home.homeDirectory = "/home/sam";

  home.stateVersion = "26.05";

  imports = [
    ./mod/sway.nix
    ./mod/helix.nix
  ];

  home.packages = with pkgs; [
    fastfetch
    foot
    firefox
  ];

  programs.git = {
    enable = true;
    userName = "kasapeli";
    userEmail = "yanratanaksambath@gmail.com";
  };

  programs.home-manager.enable = true;
}
