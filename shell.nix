{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-24.11.tar.gz") {} }:
let
# Rust nightly with wasm32-unknown-unknown target.
  f = import (fetchTarball "https://github.com/nix-community/fenix/archive/main.tar.gz") {};
  fenix = f.combine [
    f.complete.toolchain
    f.targets.wasm32-unknown-unknown.latest.rust-std
  ];
  # Get project directory.
  pd = builtins.toString ./.;
in
pkgs.mkShell {
  packages = with pkgs; [
    fenix 
    llvmPackages.bintools
  ];

# Fix Cargo build errors and contain everything for reproducibility.
  TMPDIR = "${pd}/target";

  shellHook = ''
    #### Utils ####
    BINDIR=${pd}/.nix/bin 
    export PATH=$PATH:$BINDIR
  '';
}
