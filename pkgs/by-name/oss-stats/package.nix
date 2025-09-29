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
  pname = "oss-stats";
  version = "0.2.0";
  pyproject = true;
  src = fetchFromGitHub {
    owner = "acmcsufoss";
    repo = "oss-stats";
    rev = "v${version}";
    hash = "sha256-3N703BWvu6ExHDAzktZ6qaAuxr22TsGWLdQnl5Hx8p0=";
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
    homepage = "https://github.com/acmcsufoss/oss-stats";
    license = licenses.mit;
    maintainers = with maintainers; [TheJolman];
    mainProgram = "oss-stats";
  };
}
