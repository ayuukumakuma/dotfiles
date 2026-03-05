{
  lib,
  fetchPypi,
  makeWrapper,
  python3Packages,
  wget,
}:
python3Packages.buildPythonApplication rec {
  pname = "site2skill";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Woek+FQGF9nvItp9tl6CnTMwFBbwHSGqHh/GOo/zDbM=";
  };

  nativeBuildInputs = [
    makeWrapper
    python3Packages.hatchling
  ];

  propagatedBuildInputs = with python3Packages; [
    beautifulsoup4
    markdownify
    pyyaml
  ];

  # Upstream tests rely on integration/network behavior.
  doCheck = false;
  pythonImportsCheck = [ "site2skill" ];

  postFixup = ''
    wrapProgram "$out/bin/site2skill" \
      --prefix PATH : ${lib.makeBinPath [ wget ]}
  '';

  meta = with lib; {
    description = "Turn any documentation website into a Claude Agent Skill";
    homepage = "https://github.com/laiso/site2skill";
    license = licenses.mit;
    mainProgram = "site2skill";
    platforms = platforms.all;
  };
}
