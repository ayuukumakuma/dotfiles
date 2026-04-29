{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "tree-sitter-cli";
  version = "0.26.6";

  src = fetchFromGitHub {
    owner = "tree-sitter";
    repo = "tree-sitter";
    tag = "v${version}";
    hash = "sha256-ZtzwhEmNZg5brghKNiTRZSmY8FwQeWcemY2blq9j2GM=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-u6RmwNR4QVwyuij5RlHTLC5lNNQpWMVrlQwfwF78pYc=";
  doCheck = false;

  meta = with lib; {
    description = "CLI for generating and testing Tree-sitter parsers";
    homepage = "https://github.com/tree-sitter/tree-sitter";
    license = licenses.mit;
    mainProgram = "tree-sitter";
    platforms = platforms.all;
  };
}
