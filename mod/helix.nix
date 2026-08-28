{ pkgs, lib, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt;
      }
    ];
  };

  home.packages = with pkgs; [
    nixd
  ];
}
