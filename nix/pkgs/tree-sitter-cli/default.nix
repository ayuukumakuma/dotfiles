{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "tree-sitter-cli";
  version = "0.25.10";

  src = fetchFromGitHub {
    owner = "tree-sitter";
    repo = "tree-sitter";
    tag = "v${version}";
    hash = "sha256-aHszbvLCLqCwAS4F4UmM3wbSb81QuG9FM7BDHTu1ZvM=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-4R5Y9yancbg/w3PhACtsWq0+gieUd2j8YnmEj/5eqkg=";
  doCheck = false;

  meta = with lib; {
    description = "CLI for generating and testing Tree-sitter parsers";
    homepage = "https://github.com/tree-sitter/tree-sitter";
    license = licenses.mit;
    mainProgram = "tree-sitter";
    platforms = platforms.all;
  };
}
