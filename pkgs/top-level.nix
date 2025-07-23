{
  pkgs,
  api-acmcsuf,
}: {
  oss_stats = pkgs.callPackages ./by-name/oss_stats/package.nix {};
  inherit (api-acmcsuf.packages.${pkgs.system}.default) api-acmcsuf;
}
