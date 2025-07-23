{
  pkgs,
  api-acmcsuf,
}: {
  oss_stats = pkgs.python3Packages.callPackage ./by-name/oss_stats/package.nix {};
  inherit (api-acmcsuf.packages.${pkgs.system}.default) api-acmcsuf;
}
