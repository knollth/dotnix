{
  description = "A development environment for Java with multiple JDKs, build tools, and Eclipse";

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

        # Set JDK 11 as the default
        jdkVersionDefault = pkgs.temurin-bin-11;
        jdkVersions = [
          jdkVersionDefault   # JDK 11 (LTS) - Now the default
          pkgs.temurin-bin-21 # JDK 21 (LTS)
          pkgs.temurin-bin-17 # JDK 17 (LTS)
        ];

        # Assuming eclipse-java is the correct attribute.
        # If not found during evaluation, check `nix search nixpkgs eclipse-java`
        # or search.nixos.org/packages - it might be just `pkgs.eclipse-java`.
        eclipsePackage = pkgs.eclipses.eclipse-java;

      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
          ] ++ jdkVersions ++ [
            pkgs.maven
            pkgs.gradle
            eclipsePackage
            pkgs.git
            pkgs.pkg-config
            pkgs.gcc
            pkgs.zlib
            pkgs.unzip
          ];

          JAVA_HOME="${jdkVersionDefault}/lib/openjdk";

          shellHook = ''
            echo "Java Development Environment Ready!"
            echo ""
            export JAVA_HOME="${jdkVersionDefault}/lib/openjdk"
            echo "To switch JDKs temporarily:"
            echo "  export JAVA_HOME=<path_to_other_jdk>/lib/openjdk"
            echo ""
            echo "Build tools available: mvn, gradle"
            echo "Run Eclipse IDE with the command: eclipse"
            echo ""
            export MAVEN_OPTS="-Dmaven.compiler.fork=true -Dmaven.compiler.executable=$JAVA_HOME/bin/javac"
            echo "Note: IntelliJ IDEA is expected to be installed on your host system."
            echo "It should automatically detect the JDKs available via Nix."
          '';
        };
      }
    );
}

