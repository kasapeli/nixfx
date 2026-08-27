# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nix";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Phnom_Penh";

  services.xserver.enable = true;
  
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.sam = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" ];
     packages = with pkgs; [
       tree
    ];
  };

  environment.systemPackages = with pkgs; [
     wget
     git
     helix
  ];

  services.openssh.enable = true;

  system.stateVersion = "26.05"; # Did you read the comment?

}

