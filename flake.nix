{
  description = "A nix flake that helps to add multiple nixpkgs as overlay";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, ... }@inputs:
    {
      multiNixpkgs = import ./multi-nixpkgs.nix inputs;
      multiNixpkgsOverlay =
        pkgsets: opts: final: prev:
        self.multiNixpkgs pkgsets opts;
    };
}
