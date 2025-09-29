{
  pkgs,
  api-acmcsuf,
}: {
  oss-stats = pkgs.python3Packages.callPackage ./by-name/oss-stats/package.nix {};
  api-acmcsuf = api-acmcsuf.packages.${pkgs.system}.default;
}
