# This is mostly AI generated, use at own risk


# shell.nix
# Development environment for OCaml assignment using Neovim + LSP

{ pkgs ? import <nixpkgs> {} }:

let
  # Use the consistent OCaml package set from Nixpkgs
  # Ensures compiler, LSP, dune, etc., are built against the same OCaml version
  ocamlPkgs = pkgs.ocamlPackages;

in
pkgs.mkShell {
  # Packages needed for building and running OCaml code
  buildInputs = [
    # --- Core OCaml Toolchain ---
    ocamlPkgs.ocaml          # The OCaml compiler (ocamlc, ocamlopt) & standard library
    ocamlPkgs.dune_3         # The standard build system
    ocamlPkgs.findlib        # Library manager (provides ocamlfind)

    # --- Development Experience Tools ---
    ocamlPkgs.ocaml-lsp      # Language Server for editor integration (Neovim)
    ocamlPkgs.ocamlformat    # Automatic code formatter
    ocamlPkgs.utop           # Enhanced interactive top-level (REPL)

    # --- Common System Dependencies ---
    pkgs.pkg-config          # Helps find system libraries for C bindings (good practice)
    pkgs.gcc                 # C compiler (needed for native compilation/C bindings)

    # --- OCaml Libraries Specific to Project (if any) ---
    # This assignment seems to only use the standard library,
    # but if you needed others, you'd add them like this:
    # ocamlPkgs.base
    # ocamlPkgs.stdio
  ];

  # Optional: Set environment variables or run commands when entering the shell
  # For example, you might want ocamlformat configured:
  # shellHook = ''
  #   echo "OCaml dev environment ready."
  #   # Example: export OCAMLFORMAT_PROFILE="janestreet"
  # '';
}
