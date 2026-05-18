{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "tree-sitter-cli";
  version = "0.26.8";

  src = fetchFromGitHub {
    owner = "tree-sitter";
    repo = "tree-sitter";
    tag = "v${version}";
    hash = "sha256-fcFEfoALrbpBD6rWogxJ7FNVlvDQgswoX9ylRgko+8Q=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-9FeWnWWPUWmMF15Psmul8GxGv2JceHWc2WZPmOr81gw=";
  doCheck = false;

  meta = with lib; {
    description = "CLI for generating and testing Tree-sitter parsers";
    homepage = "https://github.com/tree-sitter/tree-sitter";
    license = licenses.mit;
    mainProgram = "tree-sitter";
    platforms = platforms.all;
  };
}
