{ buildPythonApplication, dateutil, fetchPypi, keyring, lib, parsedatetime, pytz
, six, tzlocal }:

buildPythonApplication rec {
  pname = "jrnl";
  version = "1.9.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1x06bg4mhzsn9k1yw1si63k1dx676w9k3md1k1driksdyb4cjm6j";
  };

  propagatedBuildInputs = [ parsedatetime pytz six tzlocal keyring dateutil ];

  # TODO FIXME
  doCheck = false;

  meta = with lib; {
    description =
      "A command line journal application that stores your journal in a plain text file";
    homepage = "http://www.jrnl.sh";
  };
}
