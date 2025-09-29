# acmcsuf nixpkgs
Nix package definitions for acmcsuf's projects.

## Example usage
These can be used with `nix [build|run|shell]` or with a nix flake.

### With nix command
> You may need to enable nix command before doing this. See https://wiki.nixos.org/wiki/Nix_(command) for more info.

This command creates a temporary dev shell with the `oss-stats` package.
```sh
nix shell github:acmcsufoss/nixpkgs#oss-stats
```

### With flakes
> You may need to enable flakes before you can use them. See https://wiki.nixos.org/wiki/Flakes for more info.

This example flake creates a dev shell with the `oss-stats` package for all
major Unix systems.
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
            acmcsufoss.packages.${system}.oss-stats
          ];
        };
      }
    );
}
```

## Issues
Please submit an issue or contact the current maintainer ([Josh
Holman](github.com/thejolman)) if you run into any issues.
