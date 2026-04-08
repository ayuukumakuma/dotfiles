{
  lib,
  stdenvNoCC,
  fetchurl,
}:
stdenvNoCC.mkDerivation rec {
  pname = "gazectl";
  version = "0.8.2";

  src = fetchurl {
    url = "https://github.com/jnsahaj/gazectl/releases/download/v${version}/gazectl-bin";
    hash = "sha256-PBBNmrD6dyZd8xFubVFpwE3jENyDCekOCZUbV0oEt7c=";
  };

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    install -Dm755 $src $out/bin/gazectl
    runHook postInstall
  '';

  meta = with lib; {
    description = "Control monitor focus using gaze (face tracking)";
    homepage = "https://github.com/jnsahaj/gazectl";
    license = licenses.mit;
    mainProgram = "gazectl";
    platforms = platforms.darwin;
    sourceProvenance = [ sourceTypes.binaryNativeCode ];
  };
}
