---
title: "ブラウザ自動化 — cmux docs"
source_url: "https://cmux.com/ja/docs/browser-automation"
fetched_at: "2026-04-07T02:39:28.714337+00:00"
---



# ブラウザ自動化

cmux browserコマンドグループは、cmuxブラウザサーフェスに対するブラウザ自動化を提供します。ナビゲーション、DOM要素の操作、ページ状態のインスペクション、JavaScriptの実行、ブラウザセッションデータの管理に使用できます。

## コマンド一覧

| カテゴリ | サブコマンド |
| --- | --- |
| ナビゲーションとターゲティング | `identify`, `open`, `open-split`, `navigate`, `back`, `forward`, `reload`, `url`, `focus-webview`, `is-webview-focused` |
| 待機 | `wait` |
| DOM操作 | `click`, `dblclick`, `hover`, `focus`, `check`, `uncheck`, `scroll-into-view`, `type`, `fill`, `press`, `keydown`, `keyup`, `select`, `scroll` |
| インスペクション | `snapshot`, `screenshot`, `get`, `is`, `find`, `highlight` |
| JavaScriptと注入 | `eval`, `addinitscript`, `addscript`, `addstyle` |
| フレーム、ダイアログ、ダウンロード | `frame`, `dialog`, `download` |
| 状態とセッションデータ | `cookies`, `storage`, `state` |
| タブとログ | `tab`, `console`, `errors` |

## ブラウザサーフェスの指定

ほとんどのサブコマンドにはターゲットサーフェスが必要です。位置引数または--surfaceで指定できます。

```
# Open a new browser split
cmux browser open https://example.com

# Discover focused IDs and browser metadata
cmux browser identify
cmux browser identify --surface surface:2

# Positional vs flag targeting are equivalent
cmux browser surface:2 url
cmux browser --surface surface:2 url
```

## ナビゲーション

```
cmux browser open https://example.com
cmux browser open-split https://news.ycombinator.com

cmux browser surface:2 navigate https://example.org/docs --snapshot-after
cmux browser surface:2 back
cmux browser surface:2 forward
cmux browser surface:2 reload --snapshot-after
cmux browser surface:2 url

cmux browser surface:2 focus-webview
cmux browser surface:2 is-webview-focused
```

## 待機

waitを使用して、セレクタ、テキスト、URLフラグメント、ロード状態、またはJavaScript条件が満たされるまでブロックします。

```
cmux browser surface:2 wait --load-state complete --timeout-ms 15000
cmux browser surface:2 wait --selector "#checkout" --timeout-ms 10000
cmux browser surface:2 wait --text "Order confirmed"
cmux browser surface:2 wait --url-contains "/dashboard"
cmux browser surface:2 wait --function "window.__appReady === true"
```

## DOM操作

変更を伴うアクションは、スクリプトでの高速検証のために--snapshot-afterをサポートしています。

```
cmux browser surface:2 click "button[type='submit']" --snapshot-after
cmux browser surface:2 dblclick ".item-row"
cmux browser surface:2 hover "#menu"
cmux browser surface:2 focus "#email"
cmux browser surface:2 check "#terms"
cmux browser surface:2 uncheck "#newsletter"
cmux browser surface:2 scroll-into-view "#pricing"

cmux browser surface:2 type "#search" "cmux"
cmux browser surface:2 fill "#email" --text "ops@example.com"
cmux browser surface:2 fill "#email" --text ""
cmux browser surface:2 press Enter
cmux browser surface:2 keydown Shift
cmux browser surface:2 keyup Shift
cmux browser surface:2 select "#region" "us-east"
cmux browser surface:2 scroll --dy 800 --snapshot-after
cmux browser surface:2 scroll --selector "#log-view" --dx 0 --dy 400
```

## インスペクション

スクリプト用には構造化されたゲッターを、人間によるレビュー用にはスナップショット/スクリーンショットを使用します。

```
cmux browser surface:2 snapshot --interactive --compact
cmux browser surface:2 snapshot --selector "main" --max-depth 5
cmux browser surface:2 screenshot --out /tmp/cmux-page.png

cmux browser surface:2 get title
cmux browser surface:2 get url
cmux browser surface:2 get text "h1"
cmux browser surface:2 get html "main"
cmux browser surface:2 get value "#email"
cmux browser surface:2 get attr "a.primary" --attr href
cmux browser surface:2 get count ".row"
cmux browser surface:2 get box "#checkout"
cmux browser surface:2 get styles "#total" --property color

cmux browser surface:2 is visible "#checkout"
cmux browser surface:2 is enabled "button[type='submit']"
cmux browser surface:2 is checked "#terms"

cmux browser surface:2 find role button --name "Continue"
cmux browser surface:2 find text "Order confirmed"
cmux browser surface:2 find label "Email"
cmux browser surface:2 find placeholder "Search"
cmux browser surface:2 find alt "Product image"
cmux browser surface:2 find title "Open settings"
cmux browser surface:2 find testid "save-btn"
cmux browser surface:2 find first ".row"
cmux browser surface:2 find last ".row"
cmux browser surface:2 find nth 2 ".row"

cmux browser surface:2 highlight "#checkout"
```

## JavaScript実行と注入

```
cmux browser surface:2 eval "document.title"
cmux browser surface:2 eval --script "window.location.href"

cmux browser surface:2 addinitscript "window.__cmuxReady = true;"
cmux browser surface:2 addscript "document.querySelector('#name')?.focus()"
cmux browser surface:2 addstyle "#debug-banner { display: none !important; }"
```

## 状態

セッションデータコマンドはcookie、ローカル/セッションストレージ、完全なブラウザ状態スナップショットをカバーします。

```
cmux browser surface:2 cookies get
cmux browser surface:2 cookies get --name session_id
cmux browser surface:2 cookies set session_id abc123 --domain example.com --path /
cmux browser surface:2 cookies clear --name session_id
cmux browser surface:2 cookies clear --all

cmux browser surface:2 storage local set theme dark
cmux browser surface:2 storage local get theme
cmux browser surface:2 storage local clear
cmux browser surface:2 storage session set flow onboarding
cmux browser surface:2 storage session get flow

cmux browser surface:2 state save /tmp/cmux-browser-state.json
cmux browser surface:2 state load /tmp/cmux-browser-state.json
```

## タブ

ブラウザタブ操作は、アクティブなブラウザタブグループのブラウザサーフェスにマッピングされます。

```
cmux browser surface:2 tab list
cmux browser surface:2 tab new https://example.com/pricing

# Switch by index or by target surface
cmux browser surface:2 tab switch 1
cmux browser surface:2 tab switch surface:7

# Close current tab or a specific target
cmux browser surface:2 tab close
cmux browser surface:2 tab close surface:7
```

## コンソールとエラー

```
cmux browser surface:2 console list
cmux browser surface:2 console clear

cmux browser surface:2 errors list
cmux browser surface:2 errors clear
```

## ダイアログ

```
cmux browser surface:2 dialog accept
cmux browser surface:2 dialog accept "Confirmed by automation"
cmux browser surface:2 dialog dismiss
```

## フレーム

```
# Enter an iframe context
cmux browser surface:2 frame "iframe[name='checkout']"
cmux browser surface:2 click "#pay-now"

# Return to the top-level document
cmux browser surface:2 frame main
```

## ダウンロード

```
cmux browser surface:2 click "a#download-report"
cmux browser surface:2 download --path /tmp/report.csv --timeout-ms 30000
```

## よくあるパターン

### ナビゲート、待機、インスペクト

```
cmux browser open https://example.com/login
cmux browser surface:2 wait --load-state complete --timeout-ms 15000
cmux browser surface:2 snapshot --interactive --compact
cmux browser surface:2 get title
```

### フォーム入力と成功テキストの確認

```
cmux browser surface:2 fill "#email" --text "ops@example.com"
cmux browser surface:2 fill "#password" --text "$PASSWORD"
cmux browser surface:2 click "button[type='submit']" --snapshot-after
cmux browser surface:2 wait --text "Welcome"
cmux browser surface:2 is visible "#dashboard"
```

### 失敗時のデバッグアーティファクトの取得

```
cmux browser surface:2 console list
cmux browser surface:2 errors list
cmux browser surface:2 screenshot --out /tmp/cmux-failure.png
cmux browser surface:2 snapshot --interactive --compact
```

### ブラウザセッションの保存と復元

```
cmux browser surface:2 state save /tmp/session.json
# ...later...
cmux browser surface:2 state load /tmp/session.json
cmux browser surface:2 reload
```

[←APIリファレンス](https://cmux.com/ja/docs/api.html)[通知→](https://cmux.com/ja/docs/notifications.html)
