# nh 導入設計

## 目的

`nix-community/nh` を dotfiles の標準 CLI として導入し、nix-darwin の build / switch と Nix store の掃除を `just` から短く実行できるようにする。

## 背景

現在の `justfile` は `nix/` を作業ディレクトリにして、次の操作を提供している。

- `just update`: `nix flake update`
- `just switch`: `sudo -H nix run nix-darwin -- switch --flake path:.#$(nix eval --file local.nix darwinConfigName --raw)`
- `just check`: `nix flake check`
- `just update-and-switch`: update と switch の連続実行

`nh` を入れると、nix-darwin / Home Manager / NixOS の rebuild 系操作、差分確認、build 出力の可視化、掃除、検索を同じ CLI で扱える。今回の対象は macOS の nix-darwin 運用なので、まず `nh darwin` と `nh clean` に絞る。

## 方針

Home Manager の共通パッケージに `nh` を追加し、ユーザー CLI として利用可能にする。system module や自動 clean service は導入しない。

理由は次のとおり。

- 既存の CLI 群は `nix/nix-darwin/home-manager/packages/common.nix` に集約されている。
- `justfile` はすでに `nix/` を作業ディレクトリにしているため、`NH_DARWIN_FLAKE` を追加しなくても flake path を短く書ける。
- 自動掃除は便利だが、初回導入では削除対象の影響を手動で確認できる方がよい。

## 変更範囲

### `nix/nix-darwin/home-manager/packages/common.nix`

`commonPackages` に `nh` を追加する。

### `justfile`

`switch` を `nh darwin switch` ベースへ変更する。

```sh
nh darwin switch . -H $(nix eval --file local.nix darwinConfigName --raw)
```

`build` を追加し、activation なしで評価と build を確認できるようにする。

```sh
nh darwin build . -H $(nix eval --file local.nix darwinConfigName --raw)
```

`clean` を追加し、手動で Nix store と古い generations を掃除できるようにする。初期値は公式 README の例に合わせて、直近 4 日分と 3 generations を残す。

```sh
nh clean all --keep-since 4d --keep 3
```

既存の `update`、`check`、`update-and-switch` は維持する。`update-and-switch` は既存どおり `update switch` の合成にする。

## コマンド一覧

導入後の主な操作は次のとおり。

- `just build`: nix-darwin 構成を build する。
- `just switch`: nix-darwin 構成を反映する。
- `just clean`: 古い generations と不要な store path を掃除する。
- `just update`: flake inputs を更新する。
- `just update-and-switch`: flake inputs を更新してから反映する。
- `just check`: flake を検証する。

短縮 alias は既存の `u`、`s`、`c`、`us` を維持する。`build` と `clean` には初回導入では alias を追加しない。

## エラー処理

`darwinConfigName` は既存どおり `nix/local.nix` から読む。`local.nix` が不正な場合は `nix eval --file local.nix darwinConfigName --raw` が失敗し、`just` もそこで止まる。

`nh` がまだ現在のユーザー環境に存在しない初回反映前は、新しい `just switch` を直接使えない可能性がある。その場合は次のどちらかで初回反映する。

- `cd nix && sudo -H nix run nix-darwin -- switch --flake path:.#$(nix eval --file local.nix darwinConfigName --raw)`
- `cd nix && nix shell nixpkgs#nh -c nh darwin switch . -H $(nix eval --file local.nix darwinConfigName --raw)`

## 検証

Codex 実行環境では Nix コマンドが極端に遅くなることがあるため、実装時の自動検証は軽い確認に留める。

- `just --list` で新しいレシピが表示されることを確認する。
- `nixfmt` が必要な Nix ファイルに対して実行できることを確認する。
- `nix flake check`、`just build`、`just switch` はユーザー環境で実行する。

## 非対象

- `programs.nh` module の導入
- 自動 clean service の設定
- Home Manager 専用の `nh home` レシピ追加
- `NH_DARWIN_FLAKE` などの環境変数設定
- `nh search` 用レシピ追加
