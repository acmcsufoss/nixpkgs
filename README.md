# nixpkgs
Nix package definitions for acmcsuf's projects.

## Example usage
```sh
nix run github:acmcsufoss/nixpkgs#oss_stats
```

### In a flake
```nix
{
  description = "A basic flake with a shell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    acmcsufoss = {
      url = "github:acmcsufoss/nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    flake-utils,
    acmcsufoss,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          packages = [
            acmcsufoss.packages.${system}.oss_stats
          ];
        };
      }
    );
}
```
