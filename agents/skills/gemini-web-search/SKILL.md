---
name: gemini-web-search
description: Web検索が必要な場面でWebSearch, WebFetchツールの代わりに使用する。「検索して」「調べて」「最新情報を教えて」「〇〇について検索」「web search」「search for」といった依頼の時に使用する。
---

# Gemini Web Search

## Overview

Gemini CLI の `google_web_search` グラウンディング機能を使い、Web 検索を実行する。組み込みの WebSearch ツールの代わりにこのスキルを使用する。

## Preconditions

- `gemini` コマンドが利用可能であることを確認する。
- `jq` コマンドが利用可能であることを確認する。

## Workflow

1. ユーザーの依頼から検索クエリを構築する。
2. gemini コマンドを実行し、検索結果を取得する。
3. 結果を整形してユーザーに提示する。ソース URL を必ず含める。

## Command Patterns

### 基本検索

```bash
gemini -m "gemini-3-flash-preview" --output-format json -p "google_web_search: <query>. responseフィールドには閲覧したWebサイトのURLを含めること." | jq -r .response
```

`<query>` にはユーザーの検索意図を反映した検索クエリを入れる。

### クエリ構築のルール

- 日本語の依頼でも、検索クエリは検索精度が高くなる言語を選択する。
- 最新情報が必要な場合は年月を含める（例: `2026-03`）。
- 具体的なキーワードを使い、曖昧な表現を避ける。

## Troubleshooting（exit code 1）

次の順序で確認する。

1. コマンドエラー: `gemini` コマンドが見つからない。PATH を確認する。
2. 認証エラー: Gemini API の認証が未設定または期限切れ。`gemini` を対話モードで起動し認証状態を確認する。
3. パースエラー: `jq` の出力が空またはエラー。`--output-format json` を外して生出力を確認する。

## Response Policy

- 検索結果をユーザーの質問に対する回答として整理して返す。
- 参照した Web サイトの URL を Sources セクションとして末尾に記載する。
