{ config, pkgs, lib, ... }:

let
  cfg = config.programs.audio-prod;
in
{
  options.programs.audio-prod = {
    enable = lib.mkEnableOption "a comprehensive audio production environment with Reaper";

    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;

      default = with pkgs; [
        reaper
        #carla
        calf
        zam-plugins
        bespokesynth
        ninjas2
        airwindows
        surge-XT
        vital
        distrho-ports
        lsp-plugins
      ];
      description = "List of native Linux audio packages to install.";
    };

    musnix = {
      enable = lib.mkEnableOption "Enable Musnix integration";
      kernelRealtime = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable real-time kernel tweaks via Musnix.";
      };
    };

    yabridge = lib.mkOption {
      type = lib.types.package;
      default = pkgs.yabridge;
      description = "The package providing yabridge yabridgectl.";
    };

    yabridgectl = lib.mkOption {
      type = lib.types.package;
      default = pkgs.yabridgectl;
      description = "The package providing yabridge and yabridgectl.";
    };

    wine = lib.mkOption {
      type = lib.types.package;
      default = pkgs.wineWowPackages.stagingFull;
      description = "The Wine package to use for running Windows VSTs via yabridge.";
    };
  };

  # The structure here is now `config = lib.mkIf cfg.enable (let ... in { ... });`
  config = lib.mkIf cfg.enable (
    let
      # This local variable is defined *before* the attribute set is created.
      audioPackages = cfg.packages;
    in
    # The `in` is followed by the attribute set as a single value.
    {
      environment.systemPackages = audioPackages ++ [ cfg.yabridge cfg.wine ];
      musnix.enable = lib.mkIf cfg.musnix.enable true;
    }
  ); # <-- Closing parenthesis for lib.mkIf
}
