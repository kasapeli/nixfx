{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = ./art/boykisser;
      };
      modules = [
        "title"
        "seperator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "break"
        "colors"
      ];
    };
  };
}
