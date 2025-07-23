{
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  lib,
}:
buildPythonPackage rec {
  pname = "oss_stats";
  version = "0.1.0";
  pyproject = true;
  src = fetchFromGitHub {
    owner = "acmcsufoss";
    repo = "oss_stats";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
  ];

  meta = with lib; {
    description = "";
    homepage = "https://github.com/acmcsufoss/oss_stats";
    license = licenses.mit;
    maintainers = with maintainers; [TheJolman];
    mainProgram = "oss_stats";
  };
}

