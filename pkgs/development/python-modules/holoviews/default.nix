{
  lib,
  bokeh,
  buildPythonPackage,
  colorcet,
  fetchPypi,
  ipython,
  matplotlib,
  notebook,
  numpy,
  pandas,
  panel,
  param,
  pythonOlder,
  pyviz-comms,
  scipy,
}:

buildPythonPackage rec {
  pname = "holoviews";
  version = "1.19.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yrFSL3WptGN3+TZLZ1vv15gS4iAFlxRHCljiFHXVMbo=";
  };

  propagatedBuildInputs = [
    colorcet
    numpy
    pandas
    panel
    param
    pyviz-comms
  ];

  # tests not fully included with pypi release
  doCheck = false;

  pythonImportsCheck = [ "holoviews" ];

  meta = with lib; {
    description = "Python data analysis and visualization seamless and simple";
    mainProgram = "holoviews";
    homepage = "https://www.holoviews.org/";
    license = licenses.bsd3;
    maintainers = with maintainers; [ ];
  };
}
