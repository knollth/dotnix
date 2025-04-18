{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      ocamlPkgs = pkgs.ocamlPackages;
  in
  {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          ocamlPkgs.ocaml          
          ocamlPkgs.dune_3         # The standard build system
          ocamlPkgs.findlib        # Library manager (provides ocamlfind)

          ocamlPkgs.ocaml-lsp      # Language Server for editor integration (Neovim)
          ocamlPkgs.ocamlformat    # Automatic code formatter
          ocamlPkgs.utop           # Enhanced interactive top-level (REPL)

          # --- Common System Dependencies ---
          pkgs.pkg-config          # Helps find system libraries for C bindings 
          pkgs.gcc                 # C compiler (needed for native compilation/C bindings)

          # ocamlPkgs.base
          # ocamlPkgs.stdio
        ];
      };
  };
}
