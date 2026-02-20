{
  lib,
  stdenvNoCC,
  fetchurl,
  makeWrapper,
  nodejs_20,
}:
stdenvNoCC.mkDerivation rec {
  pname = "portless";
  version = "0.4.0";

  src = fetchurl {
    url = "https://registry.npmjs.org/portless/-/portless-${version}.tgz";
    hash = "sha512-CW3ERwHux/9VNrnvaSXa4sCtNlY300b5sUh6A52IBkpYMfJm7dMS4NipRVaSMFwyLAwFSp+OxGxpRD0zItiBWg==";
  };

  chalkSrc = fetchurl {
    url = "https://registry.npmjs.org/chalk/-/chalk-5.3.0.tgz";
    hash = "sha512-dLitG79d+GV1Nb/VYcCDFivJeK1hiukt9QjRNVOsUtTy1rR1YJsmpGGTZ3qJos+uw7WmWF4wUwBd9jxjocFC2w==";
  };

  nativeBuildInputs = [ makeWrapper ];
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/lib/node_modules/${pname}/node_modules" "$out/bin"
    cp -R . "$out/lib/node_modules/${pname}"

    tar -xzf ${chalkSrc} -C "$out/lib/node_modules/${pname}/node_modules"
    mv "$out/lib/node_modules/${pname}/node_modules/package" \
      "$out/lib/node_modules/${pname}/node_modules/chalk"

    makeWrapper ${nodejs_20}/bin/node "$out/bin/portless" \
      --add-flags "$out/lib/node_modules/${pname}/dist/cli.js"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Replace port numbers with stable, named .localhost URLs";
    homepage = "https://github.com/vercel-labs/portless";
    license = licenses.asl20;
    mainProgram = "portless";
    platforms = with platforms; darwin ++ linux;
  };
}
