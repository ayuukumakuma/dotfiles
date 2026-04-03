---
name: conventional-commit
description: Use this skill when creating git commits, writing commit messages, or when the user asks to commit changes. Generates Conventional Commits messages with automatic type/scope inference, optional commit splitting, and explicit approval gating before git commit.
argument-hint: "[auto-approve] [message/type hint]"
disable-model-invocation: true
---

# Conventional Commit Message and Commit Execution

## Overview

このスキルは Conventional Commits 形式のコミットメッセージを自動生成し、ユーザー承認後に `git commit` を実行します。

- 変更内容を分析して `type` / `scope` / `subject` / `body` を推定する
- 複数の論理単位が混在する場合はコミット分割を提案する
- コミット前に必ず最終確認を行う
- 既定言語は日本語（ユーザーまたはプロジェクト規約の指定があれば従う）

## Arguments

`$ARGUMENTS` はスペース区切りで解釈する。第1トークンが `true` または `false` の場合は auto-approve フラグとして扱い、それ以外はすべてヒントとして扱う。

| 位置 | 名前 | 省略 | 説明 |
|------|------|------|------|
| 1 | auto-approve | 可 | `true` で承認スキップ。`false` または省略時は承認を求める |
| 2+ | ヒント | 可 | type（例: `feat`）や subject（例: `"認証エラーを修正"`） |

### 使用例

- `/conventional-commit` -- 全自動推定、承認あり
- `/conventional-commit true` -- 全自動推定、承認スキップ
- `/conventional-commit true feat` -- type 指定、承認スキップ
- `/conventional-commit feat` -- type 指定、承認あり
- `/conventional-commit "認証エラーを修正"` -- subject 指定、承認あり

## Commit Message Rules

### Format

- 基本: `{type}(scope): {subject}`
- scope 不要時: `{type}: {subject}`
- 絵文字は使わない

### Allowed types

`feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`

### Subject

- 必須
- 簡潔で具体的に「何をどうしたか」を書く
- 動詞から書き始める
- 文末に句読点を付けない
- 長すぎない（目安: 64 文字以内）

### Body (optional)

- 必要な場合のみ付ける
- 1 行目に背景・理由
- 2 行目以降に主な変更点を箇条書きで記述
- 1 行 72 文字以内を目安にする

## Inference Rules

### type inference

差分とファイル種別から推定する。

- 機能追加・新規公開 API 追加: `feat`
- 不具合修正: `fix`
- ドキュメントのみ変更: `docs`
- テスト追加・更新: `test`
- CI/CD、ビルド設定: `ci` / `build`
- パフォーマンス改善: `perf`
- 振る舞いを変えない構造改善: `refactor`
- その他の雑多な調整: `chore`

### scope inference

変更ファイルの共通ディレクトリやモジュール名から推定する。

- 例: `frontend`, `backend`, `api`, `auth`, `docs`, `config`
- 明確に推定できない場合は scope を省略する
- プロジェクト固有の scope 規約がある場合はそれを優先する

## Split Decision Rules

次の条件に当てはまる場合、分割提案を行う。

1. 変更が明確に複数責務へ分かれる
2. 異なる type が強く混在する
3. 変更対象の領域が独立している

分割提案時は、コミット案ごとに対象ファイル一覧を示す。

## Confirmation Policy

### auto-approve が `true` の場合

確認をすべてスキップし、生成したコミットメッセージでそのまま `git commit` を実行する。
分割提案がある場合も自動で分割コミットを実行する。

### auto-approve が `false` または未指定の場合

#### When interactive question tool is available

AskUserQuestion 相当の選択式確認を使う。

- 分割するかどうか
- 最終コミット案を承認するかどうか

#### Fallback

選択式ツールがない場合はテキストで確認する。

- 承認扱い: `y`, `yes`, `はい`, `ok`, `OK`
- 拒否扱い: `n`, `no`, `いいえ`

## Workflow

1. 変更内容を確認する
2. `type` / `scope` / `subject` / `body` を自動生成する
3. 分割可能性を判定し、必要なら分割案を提示する
4. コミット案を表示し、Confirmation Policy に従って承認を得る
5. コミットを実行する
6. 実行結果を確認する

## Commands

```bash
# 変更確認
git status --short
git diff --staged
git diff

# 単一コミット（body なし）
git commit -m "type(scope): subject"

# 単一コミット（body あり）
git commit -m "$(cat <<'EOF'
type(scope): subject

背景や理由
- 変更点1
- 変更点2
EOF
)"

# 実行結果の確認
git log -1 --oneline
git status
```

分割コミットの場合は、対象ファイル単位で `git add` と `git commit` を順に実行する。

## Safety Requirements

1. auto-approve が `true` でない限り、ユーザー承認前に `git commit` を実行しない
2. 実行前にコミットメッセージ案を必ず表示する（auto-approve 時も表示はする）
3. 分割案では各コミットの対象ファイルを明示する
4. 失敗時はエラー内容を示し、再実行可能な形で案内する
