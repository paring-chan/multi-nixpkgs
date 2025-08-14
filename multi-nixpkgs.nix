{ nixpkgs, ... }:
let
  lib = nixpkgs.lib;

in
pkgsets: opts: lib.mapAttrs (name: value: import value opts) pkgsets
