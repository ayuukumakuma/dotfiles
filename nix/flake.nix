{
  description = "My Dotfiles.";

  # Darwin 設定を構築するために使う外部依存を固定する。
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    claude-code-overlay = {
      url = "github:ryoppippi/claude-code-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cf-page-to-md.url = "github:ayuukumakuma/cf-page-to-md";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }:
    let
      # このリポジトリで対象とするプラットフォーム。
      system = "aarch64-darwin";
      # ローカルの補助アプリで使う固定済みの nixpkgs パッケージセット。
      pkgs = nixpkgs.legacyPackages.${system};
      # ローカルマシン固有の値。評価時は example にフォールバックする。
      localConfigPath = ./local.nix;
      local =
        if builtins.pathExists localConfigPath then import localConfigPath else import ./local.nix.example;
      # switch の必須ターゲット名: path:.#<darwinConfigName>。
      darwinConfigName =
        if local ? darwinConfigName then
          local.darwinConfigName
        else
          throw "Missing local.darwinConfigName in nix/local.nix. Create/update it from nix/local.nix.example.";
    in
    {
      # 入力更新・チェック・switch をまとめて行うワンショットの保守コマンド。
      apps.${system}.update = {
        type = "app";
        program = toString (
          pkgs.writeShellScript "update-script" ''
            set -euo pipefail
            echo "Updating flake..."
            nix flake update
            echo "Checking flake..."
            nix flake check
            echo "Updating nix-darwin..."
            nix run nix-darwin -- switch --flake path:.#${darwinConfigName}
            echo "Update complete!"
          ''
        );
        meta = {
          description = "Update flake inputs, profile packages, and nix-darwin configuration";
        };
      };

      # `switch --flake path:.#...` から利用されるメインの nix-darwin エントリポイント。
      darwinConfigurations = {
        ${darwinConfigName} = nix-darwin.lib.darwinSystem {
          system = system;
          specialArgs = {
            inherit
              local
              inputs
              ;
          };
          modules = [
            # Home Manager を nix-darwin モジュールとして有効化する。
            home-manager.darwinModules.home-manager

            # macOS / Homebrew / Home Manager / Nix core の設定を集約する。
            ./nix-darwin/default.nix
          ];
        };
      };
    };
}
