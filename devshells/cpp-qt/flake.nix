{
  description = "Qt6 development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          # Build dependencies (tools)
          nativeBuildInputs = with pkgs; [
            cmake
            ninja
            pkg-config
            qt6.wrapQtAppsHook
          ];

          # Runtime dependencies
          buildInputs = with pkgs; [
            alsa-lib
            qt5.full
            qt5.qtwayland
            zlib
            gcc
            git
          ];

          # Environment variables
          #QT_PLUGIN_PATH = "${pkgs.qt5.qtbase}/${pkgs.qt5.qtbase.qtPluginPrefix}";
          #QML2_IMPORT_PATH = "${pkgs.qt5.qtdeclarative}/${pkgs.qt5.qtdeclarative.qtQmlPrefix}";

          shellHook = ''
            echo "Qt6 Development Environment Ready!"
            echo "CMake: $(cmake --version | head -n1)"
            echo "qmake: $(qmake --version | head -n1)"
          '';
        };
      }
    );
}
