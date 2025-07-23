{
  description = "A basic flake with a shell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    api-acmcsuf = {
      url = "github:acmcsufoss/api.acmcsuf.com";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};

        # ---- Our Packages ----
        acmcsuf-packages = import ./pkgs/top-level.nix {
          inherit pkgs;
          inherit (inputs) api-acmcsuf;
        };

        # ---- Our Libraries ----
        # acmcsuf-lib = import ./lib {lib = pkgs.lib;};
      in {
        # ---- Exposed Outputs ----

        # Exposes packages so they can be run with `nix run .#our-app`
        packages = acmcsuf-packages;

        # Activate dev shell with `nix develop` or use direnv when working in this repo
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            alejandra # .nix formatter
            statix # .nix linter
          ];
        };

        # Primary way to make packages available to other flakes
        overlays = {
          # Makes our packages available at the top level of pkgs
          # Ex: `pkgs.our-app` instead of `pkgs.acmcsufoss.our-app`
          default = final: prev: {
            inherit (acmcsuf-packages) api-acmcsuf;
          };
        };

        # nixosModules = {
        #   api-acmcsuf = import ./modules/nixos/api-acmcsuf.nix;
        # };

        # lib = acmcsuf-lib;
      }
    );
}
