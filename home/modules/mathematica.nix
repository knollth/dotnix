{ config, pkgs, ... }:
let
  mathematica = pkgs.mathematica.override {
    version = "14.2.0";
    source = pkgs.requireFile {
      name = "Wolfram_14.2.0_LIN_Bndl.sh";
      sha256 = "1y0b8b19g342ir425341r1qjc7kbbmsmwbfm8361rcakqjxsnnd0";
      message = ''
        Your override for Mathematica includes a different src for the installer,
        and it is missing.
      '';
      hashMode = "recursive";
    };
  };
in {
  home.packages = [ mathematica ];
}
