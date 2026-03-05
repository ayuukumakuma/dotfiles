---
title: "Helix Mode | Helix Mode - Zed"
source_url: "https://zed.dev/docs/helix"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Helix Mode](https://zed.dev/docs/helix.html#helix-mode)

*Work in progress. Not all Helix keybindings are implemented yet.*

Zed's Helix mode is an emulation layer that brings Helix-style keybindings and modal editing to Zed. It builds upon Zed's [Vim mode](https://zed.dev/docs/vim.html), so much of the core functionality is shared. Enabling `helix_mode` will also enable `vim_mode`.

For a guide on Vim-related features that are also available in Helix mode, please refer to our [Vim mode documentation](https://zed.dev/docs/vim.html).

To check the current status of Helix mode, or to request a missing Helix feature, see the ["Are we Helix yet?" discussion](https://github.com/zed-industries/zed/discussions/33580).

For a detailed list of Helix's default keybindings, please visit the [official Helix documentation](https://docs.helix-editor.com/keymap.html).

## [Core differences](https://zed.dev/docs/helix.html#core-differences)

Any text object that works with `m i` or `m a` also works with `]` and `[`, so for example `] (` selects the next pair of parentheses after the cursor.

[Vim Mode](https://zed.dev/docs/vim.html "Vim Mode")
[All Languages](https://zed.dev/docs/languages.html "All Languages")
