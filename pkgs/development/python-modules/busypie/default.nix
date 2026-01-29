{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest-asyncio,
  pytest-timeout,
  pytestCheckHook,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "busypie";
  version = "0.5.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rockem";
    repo = "busypie";
    tag = "v${version}";
    hash = "sha256-LaPgK36ieHKAbm9btx6t//dMdSGdzcaDJVou96D6J3U=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace "pytest-runner" ""
  '';

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  nativeCheckInputs = [
    pytest-asyncio
    pytest-timeout
    pytestCheckHook
  ];

  pythonImportsCheck = [ "busypie" ];

  meta = {
    description = "Expressive busy wait for Python";
    homepage = "https://github.com/rockem/busypie";
    changelog = "https://github.com/rockem/busypie/releases/tag/v${version}";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ fab ];
  };
}
