---
title: "設定 — cmux docs"
source_url: "https://cmux.com/ja/docs/configuration"
fetched_at: "2026-04-07T02:39:28.714337+00:00"
---



# 設定

cmuxはターミナル設定をGhosttyの設定ファイルから読み込みます。cmux管理のアプリ設定も ~/.config/cmux/settings.json で管理でき、ショートカット、自動化、サイドバー、通知、ブラウザ設定を含みます。

## 設定ファイルの場所

cmuxは以下の場所から設定を検索します（順番に）：

1. `~/.config/ghostty/config`
2. `~/Library/Application Support/com.mitchellh.ghostty/config`

設定ファイルが存在しない場合は作成してください：

```
mkdir -p ~/.config/ghostty
touch ~/.config/ghostty/config
```

## 設定例

~/.config/ghostty/config

```
font-family = SF Mono
font-size = 13
theme = One Dark
scrollback-limit = 50000
split-divider-color = #3e4451
working-directory = ~/code
```

## cmux settings.json

cmux keeps app-owned settings in a separate user file instead of mixing them into Ghostty config. On launch, if neither settings location exists, cmux writes a commented template to `~/.config/cmux/settings.json`.

1. `~/.config/cmux/settings.json`
2. `~/Library/Application Support/com.cmuxterm.app/settings.json`

**Precedence:** `~/.config/cmux/settings.json` wins over the Application Support fallback. File-managed values override the value saved in the Settings window. Remove a key to fall back to the Settings value again.

**Reload:** edit the file, then use `Cmd+Shift+,` or `cmux reload-config` to re-read it without restarting the app.

**Migrations:** keep `schemaVersion` at `1` for now. Future cmux versions will use that field for upgrades. If cmux sees a newer schema version, it logs a warning and parses known keys only.

The file accepts JSON with comments and trailing commas. The canonical schema is published at <https://raw.githubusercontent.com/manaflow-ai/cmux/main/web/data/cmux-settings.schema.json> and the source lives at <https://github.com/manaflow-ai/cmux/blob/main/web/data/cmux-settings.schema.json>.

~/.config/cmux/settings.json

```
{
  "$schema": "https://raw.githubusercontent.com/manaflow-ai/cmux/main/web/data/cmux-settings.schema.json",
  "schemaVersion": 1,

  // "app": {
  //   "appearance": "dark",
  //   "newWorkspacePlacement": "afterCurrent"
  // },

  // "browser": {
  //   "openTerminalLinksInCmuxBrowser": true,
  //   "hostsToOpenInEmbeddedBrowser": ["localhost", "*.internal.example"]
  // },

  // "workspaceColors": {
  //   "colors": {
  //     "Red": "#C0392B",
  //     "Blue": "#1565C0",
  //     "Neon Mint": "#00F5D4"
  //   }
  // },

  // "shortcuts": {
  //   "bindings": {
  //     "toggleSidebar": "cmd+b",
  //     "newTab": ["ctrl+b", "c"]
  //   }
  // },
}
```

## Schema reference

This reference covers every supported key in `settings.json`. The embedded browser, sidebar, notifications, automation, and cmux-owned keyboard shortcuts all live here.

### Metadata

`$schema`

Optional schema URL for editor completion and validation.

Type
:   `string`

Default
:   `"https://raw.githubusercontent.com/manaflow-ai/cmux/main/web/data/cmux-settings.schema.json"`

`schemaVersion`

Schema version for forward-compatible migrations. Newer versions are parsed on a best-effort basis.

Type
:   `integer`

Default
:   `1`

### `app`

General app preferences from Settings > App.

`app.language`

Preferred app language.

Type
:   `string`

Default
:   `"system"`

Allowed values
:   `system, en, ar, bs, zh-Hans, zh-Hant, da, de, es, fr, it, ja, ko, nb, pl, pt-BR, ru, th, tr`

`app.appearance`

App appearance mode.

Type
:   `string`

Default
:   `"system"`

Allowed values
:   `system, light, dark`

`app.appIcon`

Dock and app switcher icon style.

Type
:   `string`

Default
:   `"automatic"`

Allowed values
:   `automatic, light, dark`

`app.newWorkspacePlacement`

Where new workspaces are inserted in the sidebar.

Type
:   `string`

Default
:   `"afterCurrent"`

Allowed values
:   `top, afterCurrent, end`

`app.minimalMode`

Hide the workspace title bar and move controls into the sidebar.

Type
:   `boolean`

Default
:   `false`

`app.keepWorkspaceOpenWhenClosingLastSurface`

When true, closing the last surface keeps the workspace open.

Type
:   `boolean`

Default
:   `false`

`app.focusPaneOnFirstClick`

When cmux is inactive, the first click can activate and focus the clicked pane.

Type
:   `boolean`

Default
:   `true`

`app.preferredEditor`

Custom editor command used by cmux where applicable. Leave empty to use the default.

Type
:   `string`

Default
:   `""`

`app.reorderOnNotification`

Move workspaces with new notifications toward the top.

Type
:   `boolean`

Default
:   `true`

`app.sendAnonymousTelemetry`

Allow anonymous telemetry.

Type
:   `boolean`

Default
:   `true`

`app.warnBeforeQuit`

Show a confirmation before quitting cmux.

Type
:   `boolean`

Default
:   `true`

`app.renameSelectsExistingName`

Select the current name when opening rename flows.

Type
:   `boolean`

Default
:   `true`

`app.commandPaletteSearchesAllSurfaces`

Search every surface in the command palette switcher instead of only the active workspace.

Type
:   `boolean`

Default
:   `false`

### `notifications`

Notification behavior from Settings > Notifications.

`notifications.dockBadge`

Show the unread count in the Dock tile.

Type
:   `boolean`

Default
:   `true`

`notifications.showInMenuBar`

Show the menu bar extra.

Type
:   `boolean`

Default
:   `true`

`notifications.unreadPaneRing`

Highlight panes with unread notifications.

Type
:   `boolean`

Default
:   `true`

`notifications.paneFlash`

Flash the focused pane when requested.

Type
:   `boolean`

Default
:   `true`

`notifications.sound`

Notification sound preset.

Type
:   `string`

Default
:   `"default"`

Allowed values
:   `default, Basso, Blow, Bottle, Frog, Funk, Glass, Hero, Morse, Ping, Pop, Purr, Sosumi, Submarine, Tink, custom_file, none`

`notifications.customSoundFilePath`

Local path to the custom notification sound file.

Type
:   `string`

Default
:   `""`

`notifications.command`

Optional shell command to run alongside notification delivery.

Type
:   `string`

Default
:   `""`

### `sidebar`

Sidebar content and metadata visibility from Settings > Sidebar.

`sidebar.hideAllDetails`

Hide all per-workspace detail rows.

Type
:   `boolean`

Default
:   `false`

`sidebar.branchLayout`

Show git branch details stacked vertically or inline.

Type
:   `string`

Default
:   `"vertical"`

Allowed values
:   `vertical, inline`

`sidebar.showNotificationMessage`

Show the latest notification text in the sidebar.

Type
:   `boolean`

Default
:   `true`

`sidebar.showBranchDirectory`

Show the workspace working directory.

Type
:   `boolean`

Default
:   `true`

`sidebar.showPullRequests`

Show pull request metadata in the sidebar.

Type
:   `boolean`

Default
:   `true`

`sidebar.openPullRequestLinksInCmuxBrowser`

Open sidebar pull request links in the embedded cmux browser.

Type
:   `boolean`

Default
:   `true`

`sidebar.openPortLinksInCmuxBrowser`

Open sidebar port links in the embedded cmux browser.

Type
:   `boolean`

Default
:   `true`

`sidebar.showSSH`

Show SSH connection details.

Type
:   `boolean`

Default
:   `true`

`sidebar.showPorts`

Show listening ports.

Type
:   `boolean`

Default
:   `true`

`sidebar.showLog`

Show recent log snippets.

Type
:   `boolean`

Default
:   `true`

`sidebar.showProgress`

Show progress indicators.

Type
:   `boolean`

Default
:   `true`

`sidebar.showCustomMetadata`

Show custom metadata pills.

Type
:   `boolean`

Default
:   `true`

### `workspaceColors`

Workspace tab and badge colors from Settings > Workspace Colors.

`workspaceColors.indicatorStyle`

Active workspace indicator style. Legacy aliases are accepted and normalized.

Type
:   `string`

Default
:   `"leftRail"`

Allowed values
:   `leftRail, solidFill, rail, border, wash, lift, typography, washRail, blueWashColorRail`

`workspaceColors.selectionColor`

Override the selected workspace background color.

Type
:   `unknown`

Default
:   `null`

`workspaceColors.notificationBadgeColor`

Override the unread notification badge color.

Type
:   `unknown`

Default
:   `null`

`workspaceColors.colors`

Full named workspace color palette. Include built-in entries you want to keep, remove keys to remove colors, and add more named entries to extend the picker.

Type
:   `object`

Default
:   ```
    {
      "Red": "#C0392B",
      "Crimson": "#922B21",
      "Orange": "#A04000",
      "Amber": "#7D6608",
      "Olive": "#4A5C18",
      "Green": "#196F3D",
      "Teal": "#006B6B",
      "Aqua": "#0E6B8C",
      "Blue": "#1565C0",
      "Navy": "#1A5276",
      "Indigo": "#283593",
      "Purple": "#6A1B9A",
      "Magenta": "#AD1457",
      "Rose": "#880E4F",
      "Brown": "#7B3F00",
      "Charcoal": "#3E4B5E"
    }
    ```

`workspaceColors.colors` is the full palette. Keep the built-in keys you want, delete keys to remove colors from the picker, and add more named color entries to extend it. Older `paletteOverrides` and `customColors` files still parse during upgrades, but new files should use `colors`.

```
{
  "workspaceColors": {
    "colors": {
      "Red": "#C0392B",
      "Blue": "#1565C0",
      "Neon Mint": "#00F5D4"
    }
  }
}
```

### `sidebarAppearance`

Sidebar tint settings from Settings > Sidebar Appearance.

`sidebarAppearance.matchTerminalBackground`

Use the terminal background instead of the sidebar tint.

Type
:   `boolean`

Default
:   `false`

`sidebarAppearance.tintColor`

Base sidebar tint color used when light/dark overrides are not set.

Type
:   `unknown`

Default
:   `"#000000"`

`sidebarAppearance.lightModeTintColor`

Sidebar tint override for light appearance.

Type
:   `unknown`

Default
:   `null`

`sidebarAppearance.darkModeTintColor`

Sidebar tint override for dark appearance.

Type
:   `unknown`

Default
:   `null`

`sidebarAppearance.tintOpacity`

Sidebar tint opacity from 0 to 1.

Type
:   `number`

Default
:   `0.03`

### `automation`

Socket control and automation settings from Settings > Automation.

`automation.socketControlMode`

Socket control mode. Legacy aliases are accepted and normalized.

Type
:   `string`

Default
:   `"cmuxOnly"`

Allowed values
:   `off, cmuxOnly, automation, password, allowAll, openAccess, fullOpenAccess, notifications, full`

`automation.socketPassword`

Password for password-mode socket access. Use null or an empty string to clear it.

Type
:   `string | null`

Default
:   `""`

`automation.claudeCodeIntegration`

Enable cmux integration hooks for Claude Code.

Type
:   `boolean`

Default
:   `true`

`automation.claudeBinaryPath`

Custom path to the claude binary.

Type
:   `string`

Default
:   `""`

`automation.portBase`

Starting value for workspace CMUX\_PORT assignments.

Type
:   `integer`

Default
:   `9100`

`automation.portRange`

Number of ports reserved per workspace.

Type
:   `integer`

Default
:   `10`

### `customCommands`

Custom command trust settings from Settings > Custom Commands.

`customCommands.trustedDirectories`

Directories whose cmux.json commands can run without confirmation.

Type
:   `array<string>`

Default
:   ```
    []
    ```

### `browser`

Embedded browser settings from Settings > Browser.

`browser.defaultSearchEngine`

Default search engine for non-URL queries.

Type
:   `string`

Default
:   `"google"`

Allowed values
:   `google, duckduckgo, bing, kagi, startpage`

`browser.showSearchSuggestions`

Show omnibar search suggestions.

Type
:   `boolean`

Default
:   `true`

`browser.theme`

Embedded browser theme.

Type
:   `string`

Default
:   `"system"`

Allowed values
:   `system, light, dark`

`browser.openTerminalLinksInCmuxBrowser`

Open clicked terminal links in the embedded browser.

Type
:   `boolean`

Default
:   `true`

`browser.interceptTerminalOpenCommandInCmuxBrowser`

Intercept terminal open http(s) commands and route them through the embedded browser.

Type
:   `boolean`

Default
:   `true`

`browser.hostsToOpenInEmbeddedBrowser`

Allowlist of hosts that should stay inside the embedded browser.

Type
:   `array<string>`

Default
:   ```
    []
    ```

`browser.urlsToAlwaysOpenExternally`

Rules that always open matching URLs in the system browser.

Type
:   `array<string>`

Default
:   ```
    []
    ```

`browser.insecureHttpHostsAllowedInEmbeddedBrowser`

HTTP hosts allowed in the embedded browser without a warning prompt.

Type
:   `array<string>`

Default
:   ```
    [
      "localhost",
      "127.0.0.1",
      "::1",
      "0.0.0.0",
      "*.localtest.me"
    ]
    ```

`browser.showImportHintOnBlankTabs`

Show the browser import hint on blank tabs.

Type
:   `boolean`

Default
:   `true`

`browser.reactGrabVersion`

Pinned react-grab version for the browser toolbar helper.

Type
:   `string`

Default
:   `"0.1.29"`

### `shortcuts`

Keyboard shortcut settings from Settings > Keyboard Shortcuts.

`shortcuts.showModifierHoldHints`

Show shortcut hint pills while holding Cmd or Ctrl.

Type
:   `boolean`

Default
:   `true`

### `shortcuts.bindings`

Use a string for a single shortcut, or a two-item array for a chord. Example: `["ctrl+b", "c"]`. Numbered actions use `1` as the stored default and still match digits `1` through `9`.

The defaults below are the same cmux-owned actions listed on the [keyboard shortcuts page](https://cmux.com/ja/docs/keyboard-shortcuts.html).

#### アプリ

`openSettings`

設定

Default file value

`cmd+,`

`reloadConfiguration`

構成を再読み込み

Default file value

`cmd+shift+,`

`commandPalette`

コマンドパレット

Default file value

`cmd+shift+p`

`newWindow`

新規ウインドウ

Default file value

`cmd+shift+n`

`closeWindow`

ウインドウを閉じる

Default file value

`ctrl+cmd+w`

`toggleFullScreen`

フルスクリーンを切り替え

Default file value

`ctrl+cmd+f`

`sendFeedback`

フィードバックを送信

Default file value

`opt+cmd+f`

`quit`

cmuxを終了

Default file value

`cmd+q`

#### ワークスペース

`toggleSidebar`

サイドバーを切り替え

Default file value

`cmd+b`

`newTab`

新規ワークスペース

Default file value

`cmd+n`

`openFolder`

フォルダを開く

Default file value

`cmd+o`

`goToWorkspace`

ワークスペースへ移動ワークスペーススイッチャー

Default file value

`cmd+p`

`nextSidebarTab`

次のワークスペース

Default file value

`ctrl+cmd+]`

`prevSidebarTab`

前のワークスペース

Default file value

`ctrl+cmd+[`

`selectWorkspaceByNumber`

ワークスペース1…9を選択

Default file value

`cmd+1`

`renameWorkspace`

ワークスペース名を変更

Default file value

`cmd+shift+r`

`closeWorkspace`

ワークスペースを閉じる

Default file value

`cmd+shift+w`

#### サーフェス

`newSurface`

新規サーフェス

Default file value

`cmd+t`

`nextSurface`

次のサーフェス

Default file value

`cmd+shift+]`

`prevSurface`

前のサーフェス

Default file value

`cmd+shift+[`

`selectSurfaceByNumber`

サーフェス1…9を選択

Default file value

`ctrl+1`

`renameTab`

タブ名を変更

Default file value

`cmd+r`

`closeTab`

タブを閉じる

Default file value

`cmd+w`

`closeOtherTabsInPane`

ペイン内の他のタブを閉じる

Default file value

`opt+cmd+t`

`reopenClosedBrowserPanel`

閉じたブラウザパネルを再度開く

Default file value

`cmd+shift+t`

`toggleTerminalCopyMode`

ターミナルコピーモードを切り替え

Default file value

`cmd+shift+m`

#### 分割ペイン

`focusLeft`

左のペインにフォーカス

Default file value

`opt+cmd+left`

`focusRight`

右のペインにフォーカス

Default file value

`opt+cmd+right`

`focusUp`

上のペインにフォーカス

Default file value

`opt+cmd+up`

`focusDown`

下のペインにフォーカス

Default file value

`opt+cmd+down`

`splitRight`

右に分割

Default file value

`cmd+d`

`splitDown`

下に分割

Default file value

`cmd+shift+d`

`splitBrowserRight`

右にブラウザ分割

Default file value

`opt+cmd+d`

`splitBrowserDown`

下にブラウザ分割

Default file value

`opt+cmd+shift+d`

`toggleSplitZoom`

ペインズームを切り替え

Default file value

`cmd+shift+enter`

#### ブラウザ

`openBrowser`

ブラウザを開く

Default file value

`cmd+shift+l`

`focusBrowserAddressBar`

アドレスバーにフォーカス

Default file value

`cmd+l`

`browserBack`

戻る

Default file value

`cmd+[`

`browserForward`

進む

Default file value

`cmd+]`

`browserReload`

ページを再読み込みフォーカス中のブラウザ

Default file value

`cmd+r`

`browserZoomIn`

拡大

Default file value

`cmd+=`

`browserZoomOut`

縮小

Default file value

`cmd+-`

`browserZoomReset`

実寸表示

Default file value

`cmd+0`

`toggleBrowserDeveloperTools`

ブラウザ開発者ツールを切り替え

Default file value

`opt+cmd+i`

`showBrowserJavaScriptConsole`

ブラウザJavaScriptコンソールを表示

Default file value

`opt+cmd+c`

`toggleReactGrab`

React Grabを切り替えフォーカス中のブラウザ、またはターミナルにフォーカスがあるときは唯一のブラウザペイン

Default file value

`cmd+shift+g`

#### 検索

`find`

検索

Default file value

`cmd+f`

`findNext`

次を検索

Default file value

`cmd+g`

`findPrevious`

前を検索

Default file value

`opt+cmd+g`

`hideFind`

検索バーを隠す

Default file value

`cmd+shift+f`

`useSelectionForFind`

選択範囲で検索

Default file value

`cmd+e`

#### 通知

`showNotifications`

通知を表示

Default file value

`cmd+i`

`jumpToUnread`

最新の未読へ移動

Default file value

`cmd+shift+u`

`triggerFlash`

フォーカス中のパネルをフラッシュ

Default file value

`cmd+shift+h`

[←コンセプト](https://cmux.com/ja/docs/concepts.html)[カスタムコマンド→](https://cmux.com/ja/docs/custom-commands.html)
