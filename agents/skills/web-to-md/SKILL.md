---
name: web-to-md
description: page2md CLIでWebページURLをMarkdownに変換する。URLをMarkdownとして取得したい依頼、ファイル保存したい依頼の時に使用する。
---

# Web to Markdown

## Overview

`page2md` を使って 1 つの URL を Markdown に変換する。既定は標準出力モードとし、保存が明示された場合のみ保存モードを使う。

## Preconditions

- `page2md` コマンドが利用可能であることを確認する。
- `CF_ACCOUNT_ID` と `CF_API_TOKEN` が設定済みであることを確認する。
- URL が `http://` または `https://` で始まることを確認する。

## Workflow

1. 依頼が「取得のみ」か「保存あり」かを判定する。
2. 取得のみなら標準出力モードで実行する。
3. 保存ありなら `--out-dir` を指定して実行する。
4. 失敗時は `Troubleshooting` の順序で原因を切り分ける。

## Command Patterns

### CLI仕様確認（API呼び出しなし）

```bash
page2md --help-json
```

### 標準出力モード（既定）

```bash
page2md <URL>
```

### 保存モード

```bash
page2md <URL> --out-dir <DIR>
```

### 保存モード（ファイル名指定）

```bash
page2md <URL> --out-dir <DIR> --filename <NAME>
```

### 保存モード（上書き）

```bash
page2md <URL> --out-dir <DIR> --overwrite
```

## Save Mode Rules

- `--out-dir` 指定時のみ保存モードを有効化する。
- `--filename` は保存モード時にのみ指定する。
- 既存ファイルがある場合、`--overwrite` がなければエラーとして扱う。

## Troubleshooting（exit code 1）

次の順序で確認する。

1. 入力エラー: URL が未指定、または形式不正。
2. 設定エラー: `CF_ACCOUNT_ID` / `CF_API_TOKEN` が未設定、空文字、または誤設定。
3. APIエラー: API トークン権限不足、認証失敗、または Cloudflare 側エラー。
4. ファイル出力エラー: 出力先ディレクトリ不正、書き込み権限不足、`--overwrite` なしの同名衝突。

## Response Policy

- 取得のみ依頼では Markdown 本文を返す。
- 保存依頼では実行コマンドと保存先を明示する。
