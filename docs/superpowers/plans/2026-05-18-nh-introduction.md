# nh Introduction Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** `nix-community/nh` を Home Manager の共通パッケージに追加し、nix-darwin の build / switch / clean を `just` から実行できるようにする。

**Architecture:** 既存の dotfiles 構成に合わせ、CLI 追加は `nix/nix-darwin/home-manager/packages/common.nix` に閉じる。運用コマンドはトップレベル `justfile` に集約し、`nix/local.nix` の `darwinConfigName` を既存どおり参照する。

**Tech Stack:** Nix, nix-darwin, Home Manager, just, nh

---

## File Structure

- Modify: `nix/nix-darwin/home-manager/packages/common.nix`
  - Home Manager で全 profile 共通に入れる CLI package を管理する。
- Modify: `justfile`
  - `nix/` を作業ディレクトリにした運用レシピを管理する。

## Task 1: nh package を追加する

**Files:**
- Modify: `nix/nix-darwin/home-manager/packages/common.nix`

- [ ] **Step 1: 現在の package 一覧を確認する**

Run:

```bash
sed -n '1,180p' nix/nix-darwin/home-manager/packages/common.nix
```

Expected: `commonPackages = with pkgs; [` の中に CLI package が並び、`just` と `mise` が含まれている。

- [ ] **Step 2: `nh` を追加する**

`commonPackages` の CLI 群に `nh` を追加する。配置は `just` の近くにする。

```nix
    git
    just
    nh
    mise
```

- [ ] **Step 3: Nix formatter を実行する**

Run:

```bash
nixfmt nix/nix-darwin/home-manager/packages/common.nix
```

Expected: コマンドが成功し、意味のない差分が出ない。

## Task 2: nh 用 just レシピを追加する

**Files:**
- Modify: `justfile`

- [ ] **Step 1: 現在のレシピを確認する**

Run:

```bash
sed -n '1,120p' justfile
```

Expected: `update`、`switch`、`check`、`update-and-switch` があり、`switch` は `nix run nix-darwin` を使っている。

- [ ] **Step 2: 共通式を `darwin_config_name` 変数に切り出す**

`justfile` の先頭に次を追加する。

```just
darwin_config_name := "$(nix eval --file local.nix darwinConfigName --raw)"
```

- [ ] **Step 3: `build` レシピを追加する**

`switch` の前に次を追加する。

```just
[working-directory("nix")]
build:
    nh darwin build . -H {{darwin_config_name}}
```

- [ ] **Step 4: `switch` レシピを nh ベースに変更する**

既存の `switch` 本体を次に置き換える。

```just
[working-directory("nix")]
switch:
    nh darwin switch . -H {{darwin_config_name}}
```

- [ ] **Step 5: `clean` レシピを追加する**

`check` の後に次を追加する。

```just
[working-directory("nix")]
clean:
    nh clean all --keep-since 4d --keep 3
```

- [ ] **Step 6: 既存 alias を維持する**

`alias u := update`、`alias s := switch`、`alias c := check`、`alias us := update-and-switch` は残す。`build` と `clean` の alias は追加しない。

## Task 3: 軽量検証と差分確認

**Files:**
- Verify: `justfile`
- Verify: `nix/nix-darwin/home-manager/packages/common.nix`

- [ ] **Step 1: `just --list` を確認する**

Run:

```bash
just --list
```

Expected: `build`、`clean`、`switch`、`update`、`update-and-switch`、`check` が表示される。

- [ ] **Step 2: 差分を確認する**

Run:

```bash
git diff -- justfile nix/nix-darwin/home-manager/packages/common.nix
```

Expected: 差分は `nh` package 追加、`nh darwin` レシピ追加、`clean` レシピ追加に限定される。

- [ ] **Step 3: Nix 実行検証はユーザー環境へ引き継ぐ**

Codex 実行環境では Nix コマンドが極端に遅くなることがあるため、次は実行しない。

```bash
cd nix && nix flake check
just build
just switch
```

Expected: 最終報告で、これらは未実行でありユーザー側実行が必要だと明記する。

## Task 4: code-simplifier と最終確認

**Files:**
- Review: `justfile`
- Review: `nix/nix-darwin/home-manager/packages/common.nix`

- [ ] **Step 1: code-simplifier の観点で確認する**

変更後の `justfile` が重複を増やしていないか確認する。`darwinConfigName` の評価式は `darwin_config_name` 変数へ切り出されていること。

- [ ] **Step 2: 最終 status を確認する**

Run:

```bash
git status --short
```

Expected: 今回の変更は `justfile` と `nix/nix-darwin/home-manager/packages/common.nix` のみ。既存の unrelated 変更はそのまま残っている。
