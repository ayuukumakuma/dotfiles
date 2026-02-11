{
  lib,
  stdenvNoCC,
  fetchurl,
  makeWrapper,
  nodejs_20,
}:
stdenvNoCC.mkDerivation rec {
  pname = "git-cz";
  version = "4.9.0";

  src = fetchurl {
    url = "https://registry.npmjs.org/git-cz/-/git-cz-${version}.tgz";
    hash = "sha256-SKznj4R24Z8oQ1yIW9wsUcndosEreuj8xXre2puHNDs=";
  };

  nativeBuildInputs = [ makeWrapper ];
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/lib/node_modules/${pname}" "$out/bin"
    cp -R . "$out/lib/node_modules/${pname}"

    makeWrapper ${nodejs_20}/bin/node "$out/bin/git-cz" \
      --add-flags "$out/lib/node_modules/${pname}/lib/bin/git-cz.js"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Simple commitizen for git";
    homepage = "https://github.com/streamich/git-cz";
    license = licenses.mit;
    mainProgram = "git-cz";
    platforms = platforms.all;
  };
}
