{ config, pkgs, ... }:
let
  mathematica = pkgs.mathematica.override {
    version = "14.2.0";
    source = pkgs.requireFile {
      name = "Wolfram_14.2.0_LIN_Bndl.sh";
      sha256 = "a059abbbc453b11ccc40d52d5e755d6b1e2671c8818c22488e828c97c2420bf8";
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
