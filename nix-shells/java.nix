
{
  description = "A development environment for Java with multiple JDKs, build tools, and Eclipse";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable"; # Or specify a preferred stable branch/commit
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        jdkVersionDefault = pkgs.temurin-bin-21; # Set the default JDK (e.g., latest LTS)
        jdkVersions = [
          jdkVersionDefault # JDK 21 (LTS)
          pkgs.temurin-bin-17 # JDK 17 (LTS)
          pkgs.temurin-bin-11 # JDK 11 (LTS)
        ];
        eclipsePackage = pkgs.eclipse-java;

      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
          ] ++ jdkVersions ++ [ # Include all selected JDKs
            pkgs.maven
            pkgs.gradle

            eclipsePackage

            pkgs.git # Version control

            pkgs.pkg-config
            pkgs.gcc # Or pkgs.clang depending on preference/need
            pkgs.zlib # Often required by Java tooling or libraries
            pkgs.unzip # Useful for handling archives

            # --- Optional Quality of Life Tools ---
            # pkgs.jenv # Tool to manage multiple Java versions (alternative to manual JAVA_HOME)
            # Consider adding linters or other tools if desired
          ];

          # Commands or environment variables set when entering the shell
          shellHook = ''
            echo "Java Development Environment Ready!"
            echo ""
            # Set JAVA_HOME to the default JDK selected above
            export JAVA_HOME="${jdkVersionDefault}/lib/openjdk"
            echo "Default JAVA_HOME set to: $JAVA_HOME (JDK ${jdkVersionDefault.version})"
            echo ""
            echo "Available JDKs:"
            # List paths for easy switching (manual example)
            ${pkgs.lib.concatMapStringsSep "\n" (jdk: ''
              echo "  - ${jdk.name}: ${jdk}/lib/openjdk"
            '') jdkVersions}
            echo ""
            echo "To switch JDKs temporarily:"
            echo "  export JAVA_HOME=<path_to_other_jdk>/lib/openjdk"
            # Example: export JAVA_HOME="${pkgs.temurin-bin-17}/lib/openjdk"
            echo ""
            echo "Build tools available: mvn, gradle"
            echo "Run Eclipse IDE with the command: eclipse"
            echo ""
            # Ensure Maven uses the shell's JDK
            export MAVEN_OPTS="-Dmaven.compiler.fork=true -Dmaven.compiler.executable=$JAVA_HOME/bin/javac"

            # Add the bin directories of all selected JDKs to PATH
            # This makes `java`, `javac`, etc., from the *default* JDK available directly,
            # but also allows calling specific versions like `java-17` if packages provide them
            # (Note: Temurin packages might not create versioned symlinks by default)
            # export PATH="${pkgs.lib.makeBinPath jdkVersions}:$PATH" # Alternative PATH setup

            # Inform the user about IntelliJ IDEA
            echo "Note: IntelliJ IDEA is expected to be installed on your host system."
            echo "It should automatically detect the JDKs available via Nix."
          '';
        };

        # You could define additional shells here if needed, e.g., pre-configured for specific JDKs
        # devShells.jdk17 = pkgs.mkShell { ... };
      }
    );
}
