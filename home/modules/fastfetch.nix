{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "NixOS";
        padding = {
          right = 1;
        };
      };
      display = {
        size = {
          binaryPrefix = "si";
        };
        color = "blue";
        separator = " : ";
      };
      modules = [
        "separator"
        "os"
        "kernel"
        "shell"
        {
          type = "separator";
          format = "";
        }
        {
          type = "host";
          format = "Framework 13";
        }
        "cpu"
        "memory"
        {
          type = "separator";
          format = "";
        }
        "Terminal"
        {
          type="terminaltheme";
          format = "Terafox";
        }
        "TerminalFont"
        "uptime"
        "separator"
        "colors"
      ];
    };

  };
}
