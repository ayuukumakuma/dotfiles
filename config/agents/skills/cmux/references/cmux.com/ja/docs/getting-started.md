---
title: "はじめに — cmux docs"
source_url: "https://cmux.com/ja/docs/getting-started"
fetched_at: "2026-04-07T02:39:28.714337+00:00"
---



# はじめに

cmuxはGhosttyベースの軽量なネイティブmacOSターミナルで、複数のAIコーディングエージェントを管理するために設計されています。縦タブ、通知パネル、socketベースの制御APIを搭載しています。

## インストール

### DMG（推奨）

[Mac版をダウンロード](https://github.com/manaflow-ai/cmux/releases/latest/download/cmux-macos.dmg)

.dmgを開き、cmuxをアプリケーションフォルダにドラッグしてください。cmuxはSparkle経由で自動更新されるため、ダウンロードは一度だけで済みます。

### Homebrew

```
brew tap manaflow-ai/cmux
brew install --cask cmux
```

後で更新する場合：

```
brew upgrade --cask cmux
```

初回起動時、macOSが確認済みの開発者からのアプリを開くことの確認を求める場合があります。**開く**をクリックして続行してください。

## インストールの確認

cmuxを開くと、以下が表示されるはずです：

* 左側に縦タブサイドバーがあるターミナルウィンドウ
* 既に開かれた1つのワークスペース
* 入力可能なGhosttyベースのターミナル

## CLIセットアップ

cmuxには自動化用のコマンドラインツールが含まれています。cmuxターミナル内では自動的に動作します。cmuxの外部からCLIを使用するには、シンボリックリンクを作成してください：

```
sudo ln -sf "/Applications/cmux.app/Contents/Resources/bin/cmux" /usr/local/bin/cmux
```

これで以下のようなコマンドを実行できます：

```
cmux list-workspaces
cmux notify --title "Build Complete" --body "Your build finished"
```

## 自動更新

cmuxはSparkle経由で自動的に更新を確認します。更新が利用可能な場合、タイトルバーに更新ピルが表示されます。メニューバーのcmux > アップデートを確認から手動で確認することもできます。

## セッション復元（現在の動作）

再起動後、cmuxはレイアウトとメタデータのみを復元します：

* ウィンドウ、ワークスペース、ペインのレイアウト
* 作業ディレクトリ
* ターミナルのスクロールバック（ベストエフォート）
* ブラウザのURLとナビゲーション履歴

cmuxはライブプロセスの状態はまだ復元しません。Claude Code、tmux、vimなどのアクティブなターミナルアプリセッションは、アプリの再起動後に再開されません。

## 動作要件

* macOS 14.0以降
* Apple SiliconまたはIntel Mac

[コンセプト→](https://cmux.com/ja/docs/concepts.html)
