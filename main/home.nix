{ pkgs, ... }:

{
  home.username = "sam";
  home.homeDirectory = "/home/sam";

  home.stateVersion = "26.05";

  imports = [
    ./helix.nix
    ./sway/waybar.nix
    ./sway/sway.nix
    ./fastfetch/fastfetch.nix
  ];

  home.packages = with pkgs; [
    fastfetch
    foot
    firefox
    monocraft
    maple-mono.NF
  ];

  fonts.fontconfig.enable = true;

  programs.git = {
    enable = true;
    userName = "kasapeli";
    userEmail = "yanratanaksambath@gmail.com";
  };

  programs.home-manager.enable = true;
}
