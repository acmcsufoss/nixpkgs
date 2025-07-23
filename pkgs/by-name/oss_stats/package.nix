{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  hatchling,
  pythonRelaxDepsHook,
  alive-progress,
  click,
  pygithub,
  python-dotenv,
  questionary,
  rich,
}:
buildPythonPackage rec {
  pname = "oss_stats";
  version = "0.1.1";
  pyproject = true;
  src = fetchFromGitHub {
    owner = "acmcsufoss";
    repo = "oss_stats";
    rev = "v${version}";
    hash = "sha256-cbOBN1fEhhxvJvmV+5jYsd9mc4ETj3YUGvrzRCAWSIg=";
  };

  build-system = [
    hatchling
  ];

  # NOTE: Might be better to use uv2nix at some point, but this is simpler
  nativeBuildInputs = [
    pythonRelaxDepsHook
  ];

  pythonRelaxDeps = [
    "alive-progress"
    "click"
    "pygithub"
    "python-dotenv"
    "rich"
  ];

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
