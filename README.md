# Multi-Nixpkgs

A helper to generate overlay for multiple nixpkgs instances

## Usage

Use flakes

```nix
{
    inputs = {
        nixpkgs = ...;
        nixpkgs-unstable = ...;
        nixpkgs-something = ...;

        multi-nixpkgs = {
            url = "github:paring-chan/multi-nixpkgs";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =  { multi-nixpkgs, nixpkgs, ... }@inputs:
        let system = "x86_64-linux";
            pkgs = import nixpkgs {
                inherit system;
                overlays = [
                    (with inputs; multi-nixpkgs.multiNixpkgsOverlay {
                        unstable = nixpkgs-unstable;
                        something = nixpkgs-something;
                    } {
                        # add nixpkgs config to this
                    })
                ];
            };
        in {
            # ...
        };
}

