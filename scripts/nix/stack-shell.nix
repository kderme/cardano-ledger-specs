{ system ? builtins.currentSystem
, config ? {}
, pkgs ? import (import ./fetch-nixpkgs.nix) { inherit system config; }
}:

with pkgs;

haskell.lib.buildStackProject {
  name = "cardano-ledger-env";
  buildInputs = [ zlib openssl git ];
  ghc = haskell.packages.ghc863.ghc;
}
