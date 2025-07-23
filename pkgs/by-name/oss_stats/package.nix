{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  hatchling,
  alive-progress,
  click,
  pygithub,
  python-dotenv,
  questionary,
  rich,
}:
buildPythonPackage rec {
  pname = "oss_stats";
  version = "0.1.0";
  pyproject = true;
  src = fetchFromGitHub {
    owner = "acmcsufoss";
    repo = "oss_stats";
    rev = "v${version}";
    hash = "sha256-j+f2M2C87Lt5ySkvGuqKI4WSMEqG2/GkwGCuU4b+lcM=";
  };

  build-system = [
    hatchling
  ];

  # NOTE: Might be better to use uv2nix at some point, but this is simpler
  dependencies = [
    alive-progress
    click
    pygithub
    python-dotenv
    questionary
    rich
  ];

  meta = with lib; {
    description = "";
    homepage = "https://github.com/acmcsufoss/oss_stats";
    license = licenses.mit;
    maintainers = with maintainers; [TheJolman];
    mainProgram = "oss_stats";
  };
}
