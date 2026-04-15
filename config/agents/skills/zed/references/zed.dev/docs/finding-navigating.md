---
title: "Finding & Navigating | Finding and Navigating Code - Zed"
source_url: "https://zed.dev/docs/finding-navigating"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Finding & Navigating](https://zed.dev/docs/finding-navigating.html#finding--navigating)

Zed provides several ways to move around your codebase quickly. Here's an overview of the main navigation tools.

## [Command Palette](https://zed.dev/docs/finding-navigating.html#command-palette)

The Command Palette (`cmd-shift-p|ctrl-shift-p`) is your gateway to almost everything in Zed. Type a few characters to filter commands, then press Enter to execute.

[Learn more about the Command Palette →](https://zed.dev/docs/command-palette.html)

## [File Finder](https://zed.dev/docs/finding-navigating.html#file-finder)

Open any file in your project with `cmd-p|ctrl-p`. Type part of the filename or path to narrow results.

## [Project Search](https://zed.dev/docs/finding-navigating.html#project-search)

Search across all files with `cmd-shift-h|ctrl-shift-h`. Start typing in the search field to begin searching—results appear as you type.

Results appear in a [multibuffer](https://zed.dev/docs/multibuffers.html), letting you edit matches in place.

To disable automatic search and require pressing Enter instead, open the Settings Editor (`cmd-,|ctrl-,`), search for "search on input", and toggle the setting off. Or add this to your settings.json:

```
{
  "search_on_input": false
}
```

## [Go to Definition](https://zed.dev/docs/finding-navigating.html#go-to-definition)

Jump to where a symbol is defined with `f12|f12` (or `Cmd+Click` / `Ctrl+Click`). If there are multiple definitions, they open in a multibuffer.

## [Go to Symbol](https://zed.dev/docs/finding-navigating.html#go-to-symbol)

* **Current file:** `cmd-shift-o|ctrl-shift-o` opens an outline of symbols in the active file
* **Entire project:** `cmd-t|ctrl-t` searches symbols across all files

## [Outline Panel](https://zed.dev/docs/finding-navigating.html#outline-panel)

The Outline Panel (`cmd-shift-b|ctrl-shift-b`) shows a persistent tree view of symbols in the current file. It's especially useful with [multibuffers](https://zed.dev/docs/multibuffers.html) for navigating search results or diagnostics.

[Learn more about the Outline Panel →](https://zed.dev/docs/outline-panel.html)

## [Tab Switcher](https://zed.dev/docs/finding-navigating.html#tab-switcher)

Quickly switch between open tabs with `ctrl-tab|ctrl-tab`. Tabs are sorted by recent use—keep holding Ctrl and press Tab to cycle through them.

[Learn more about the Tab Switcher →](https://zed.dev/docs/tab-switcher.html)

## [Quick Reference](https://zed.dev/docs/finding-navigating.html#quick-reference)

| Task | Keybinding |
| --- | --- |
| Command Palette | `cmd-shift-p` |
| Open file | `cmd-p` |
| Project search | `cmd-shift-h` |
| Go to definition | `f12` |
| Find references | `alt-shift-f12` |
| Symbol in file | `cmd-shift-o` |
| Symbol in project | `cmd-t` |
| Outline Panel | `cmd-shift-b` |
| Tab Switcher | `ctrl-tab` |

[Multibuffers](https://zed.dev/docs/multibuffers.html "Multibuffers")
[Command Palette](https://zed.dev/docs/command-palette.html "Command Palette")
