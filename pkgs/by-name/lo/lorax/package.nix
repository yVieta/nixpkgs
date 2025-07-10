{
  fetchFromGitHub,
  lib,
  python3Packages,
  dnf5,
}:

python3Packages.buildPythonApplication rec {
  pname = "lorax";
  version = "43.6-1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "weldr";
    repo = "lorax";
    tag = "lorax-${version}";
    hash = "sha256-nCuvePkvT8b0+lUyougiywIQsSJZ3pfnsykHSEvaWqE=";
  };

  build-system = with python3Packages; [
    setuptools
  ];
  
  postInstall = ''
    cp -r src/bin $out
  '';
  
  dependencies = with python3Packages; [
    mako
    libselinux
  ];
  
  meta = {
    description = "Set of tools used to create bootable images";
    mainProgram = "lorax";
    homepage = "https://weldr.io/lorax/";
    license = with lib.licenses; [ gpl2Only ];
    maintainers = with lib.maintainers; [ vieta ];
  };
}
