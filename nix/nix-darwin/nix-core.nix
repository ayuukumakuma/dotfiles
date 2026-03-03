{ inputs, lib, ... }:
{
  # nixpkgs の共通設定。
  nixpkgs = {
    config = {
      allowUnfree = false;
      # unfree はテーマ拡張パッケージのみ個別許可する。
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "islands-dark-vscode" ];
    };
    overlays = [ inputs.claude-code-overlay.overlays.default ];
  };

  # このホストで共有する Nix のコア設定。
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
      keep-outputs = true;
      keep-derivations = true;
      # claude-code-overlay 用のバイナリキャッシュ。
      extra-substituters = [ "https://ryoppippi.cachix.org" ];
      # claude-code-overlay のバイナリキャッシュ用公開鍵。
      extra-trusted-public-keys = [
        "ryoppippi.cachix.org-1:b2LbtWNvJeL/qb1B6TYOMK+apaCps4SCbzlPRfSQIms="
      ];
    };
  };
}
