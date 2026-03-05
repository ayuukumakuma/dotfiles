---
title: "Getting Started | Getting Started with Zed"
source_url: "https://zed.dev/docs/index"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Getting Started](https://zed.dev/docs/index.html#getting-started)

Zed is an open-source code editor with built-in collaboration and AI tools.

This guide covers the essential commands, environment setup, and navigation basics.

## [Quick Start](https://zed.dev/docs/index.html#quick-start)

### [Welcome Page](https://zed.dev/docs/index.html#welcome-page)

When you open Zed without a folder, you see the welcome page in the main editor area. The welcome page offers quick actions to open a folder, clone a repository, or view documentation. Once you open a folder or file, the welcome page disappears. If you split the editor into multiple panes, the welcome page appears only in the center pane when empty—other panes show a standard empty state.

To reopen the welcome page, close all items in the center pane or use the command palette to search for "Welcome".

### [1. Open a Project](https://zed.dev/docs/index.html#1-open-a-project)

Open a folder from the command line:

```
zed ~/projects/my-app
```

Or use `Cmd+O` (macOS) / `Ctrl+O` (Linux/Windows) to open a folder from within Zed.

### [2. Learn the Essential Commands](https://zed.dev/docs/index.html#2-learn-the-essential-commands)

| Action | macOS | Linux/Windows |
| --- | --- | --- |
| Command palette | `Cmd+Shift+P` | `Ctrl+Shift+P` |
| Go to file | `Cmd+P` | `Ctrl+P` |
| Go to symbol | `Cmd+Shift+O` | `Ctrl+Shift+O` |
| Find in project | `Cmd+Shift+F` | `Ctrl+Shift+F` |
| Toggle terminal | `` Ctrl+` `` | `` Ctrl+` `` |
| Open settings | `Cmd+,` | `Ctrl+,` |

The command palette (`Cmd+Shift+P`) is your gateway to every action in Zed. If you forget a shortcut, search for it there.

### [3. Configure Your Editor](https://zed.dev/docs/index.html#3-configure-your-editor)

Open the Settings Editor with `Cmd+,` (macOS) or `Ctrl+,` (Linux/Windows). Search for any setting and change it directly.

Common first changes:

* **Theme**: Press `Cmd+K Cmd+T` (macOS) or `Ctrl+K Ctrl+T` (Linux/Windows) to open the theme selector
* **Font**: Search for `buffer_font_family` in Settings
* **Format on save**: Search for `format_on_save` and set to `on`

### [4. Set Up Your Language](https://zed.dev/docs/index.html#4-set-up-your-language)

Zed includes built-in support for many languages. For others, install the extension:

1. Open Extensions with `Cmd+Shift+X` (macOS) or `Ctrl+Shift+X` (Linux/Windows)
2. Search for your language
3. Click Install

See [Languages](https://zed.dev/docs/languages.html) for language-specific setup instructions.

### [5. Try AI Features](https://zed.dev/docs/index.html#5-try-ai-features)

Zed includes built-in AI assistance. Open the Agent Panel with `Cmd+Shift+A` (macOS) or `Ctrl+Shift+A` (Linux/Windows) to start a conversation, or use `Cmd+Enter` (macOS) / `Ctrl+Enter` (Linux/Windows) for inline assistance.

See [AI Overview](https://zed.dev/docs/ai/overview.html) to configure providers and learn what's possible.

## [Coming from Another Editor?](https://zed.dev/docs/index.html#coming-from-another-editor)

We have dedicated guides for switching from other editors:

* [VS Code](https://zed.dev/docs/migrate/vs-code.html) — Import settings, map keybindings, find equivalent features
* [IntelliJ IDEA](https://zed.dev/docs/migrate/intellij.html) — Adapt to Zed's approach to navigation and refactoring
* [PyCharm](https://zed.dev/docs/migrate/pycharm.html) — Set up Python development in Zed
* [WebStorm](https://zed.dev/docs/migrate/webstorm.html) — Configure JavaScript/TypeScript workflows
* [RustRover](https://zed.dev/docs/migrate/rustrover.html) — Rust development in Zed

You can also enable familiar keybindings:

* **Vim**: Enable `vim_mode` in settings. See [Vim Mode](https://zed.dev/docs/vim.html).
* **Helix**: Enable `helix_mode` in settings. See [Helix Mode](https://zed.dev/docs/helix.html).

## [Join the Community](https://zed.dev/docs/index.html#join-the-community)

Zed is open source. Join us on GitHub or in Discord to contribute code, report bugs, or suggest features.

* [Discord](https://discord.com/invite/zedindustries)
* [GitHub Discussions](https://github.com/zed-industries/zed/discussions)
* [Zed Reddit](https://www.reddit.com/r/ZedEditor)

[Installation](https://zed.dev/docs/installation.html "Installation")
