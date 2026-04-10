{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "yaskkserv2";
  version = "0.1.7";

  src = fetchFromGitHub {
    owner = "wachikun";
    repo = pname;
    tag = version;
    hash = "sha256-bF8OHP6nvGhxXNvvnVCuOVFarK/n7WhGRktRN4X5ZjE=";
  };

  cargoHash = "sha256-cycs8Zism228rjMaBpNYa4K1Ll760UhLKkoTX6VJRU0=";
  doCheck = false;

  meta = with lib; {
    description = "Yet Another SKK server";
    homepage = "https://github.com/wachikun/yaskkserv2";
    license = with licenses; [
      mit
      asl20
    ];
    mainProgram = "yaskkserv2";
    platforms = platforms.unix;
  };
}
