{ pkgs, ... }:

{
  # TODO: organize
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nix.settings.substituters = [
    "https://mirror.sjtu.edu.cn/nix-channels/store"
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://cache.nixos.org"
  ];

  services.playit = {
    enable = true;
    secretPath = /etc/playit/secret.toml;
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "performance";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "performance";

      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;

      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;

      DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
    };
  };

  networking.hostName = "nix";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Phnom_Penh";

  services.flatpak.enable = true;
  services.xserver.enable = true;
  programs.sway.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.direnv = {
    enable = true;
    loadInNixShell = true;
    nix-direnv.enable = true;
  };

  stylix = {
    enable = true;
    image = ./wp/gruvbox-girl.png;
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    fonts = {
      monospace = {
        package = pkgs.maple-mono.NF;
        name = "Maple Mono NF";
      };
    };

    opacity = {
      terminal = 0.75;
    };
  };

  users.users.sam = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    packages = with pkgs; [
      tree
    ];
  };

  users.defaultUserShell = pkgs.fish;

  environment.systemPackages = with pkgs; [
    wget
    git
    helix
  ];

  services.openssh.enable = true;
  programs.ssh.startAgent = true;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting    
    '';
  };

  system.stateVersion = "26.05";

}
