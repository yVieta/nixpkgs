{
  lib,
  buildPythonPackage,
  fetchPypi,
  dataclasses-json,
  pycryptodome,
  setuptools-scm,
  pytest-asyncio_0,
  pytest-cases,
  pytest-cov-stub,
  pytestCheckHook,
  pytz,
}:

buildPythonPackage rec {
  pname = "pysiaalarm";
  version = "3.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-9icZnEpSaezVj9EH5s1u2mB2h9jP/oZcpkVE0WFM4W8=";
  };

  postPatch = ''
    substituteInPlace setup.cfg \
      --replace "==" ">="
  '';

  build-system = [ setuptools-scm ];

  propagatedBuildInputs = [
    dataclasses-json
    pycryptodome
    pytz
  ];

  nativeCheckInputs = [
    pytest-asyncio_0
    pytest-cases
    pytest-cov-stub
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "pysiaalarm"
    "pysiaalarm.aio"
  ];

  meta = {
    description = "Python package for creating a client that talks with SIA-based alarm systems";
    homepage = "https://github.com/eavanvalkenburg/pysiaalarm";
    changelog = "https://github.com/eavanvalkenburg/pysiaalarm/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ dotlambda ];
  };
}
