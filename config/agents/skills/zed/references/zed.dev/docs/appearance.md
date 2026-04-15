---
title: "Appearance | Appearance and Visual Customization - Zed"
source_url: "https://zed.dev/docs/appearance"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Appearance](https://zed.dev/docs/appearance.html#appearance)

Customize Zed's visual appearance to match your preferences. This guide covers themes, fonts, icons, and other visual settings.

For information on how the settings system works, see [All Settings](https://zed.dev/docs/reference/all-settings.html).

## [Customize Zed in 5 Minutes](https://zed.dev/docs/appearance.html#customize-zed-in-5-minutes)

Here's how to make Zed feel like home:

1. **Pick a theme**: Press `cmd-k cmd-t|ctrl-k ctrl-t` to open the Theme Selector. Arrow through the list to preview themes in real time, and press Enter to apply.
2. **Choose an icon theme**: Run `icon theme selector: toggle` from the command palette to browse icon themes.
3. **Set your font**: Open the Settings Editor with `cmd-,|ctrl-,` and search for `buffer_font_family`. Set it to your preferred coding font.
4. **Adjust font size**: In the same Settings Editor, search for `buffer_font_size` and `ui_font_size` to tweak the editor and interface text sizes.

That's it. You now have a personalized Zed setup.

## [Themes](https://zed.dev/docs/appearance.html#themes)

Install themes from the Extensions page (`zed: extensions`), then switch between them with the Theme Selector (`cmd-k cmd-t|ctrl-k ctrl-t`).

Zed supports separate themes for light and dark mode with automatic switching based on your system preference:

```
{
  "theme": {
    "mode": "system",
    "light": "One Light",
    "dark": "One Dark"
  }
}
```

You can also override specific theme attributes for fine-grained control.

→ [Themes documentation](https://zed.dev/docs/themes.html)

## [Icon Themes](https://zed.dev/docs/appearance.html#icon-themes)

Customize file and folder icons in the Project Panel and tabs. Browse available icon themes with the Icon Theme Selector (`icon theme selector: toggle` in the command palette).

Like color themes, icon themes support separate light and dark variants:

```
{
  "icon_theme": {
    "mode": "system",
    "light": "Zed (Default)",
    "dark": "Zed (Default)"
  }
}
```

→ [Icon Themes documentation](https://zed.dev/docs/icon-themes.html)

## [Fonts](https://zed.dev/docs/appearance.html#fonts)

Zed uses three font settings for different contexts:

| Setting | Used for |
| --- | --- |
| `buffer_font_family` | Editor text |
| `ui_font_family` | Interface elements |
| `terminal.font_family` | [Terminal](https://zed.dev/docs/terminal.html) |

Example configuration:

```
{
  "buffer_font_family": "JetBrains Mono",
  "buffer_font_size": 14,
  "ui_font_family": "Inter",
  "ui_font_size": 16,
  "terminal": {
    "font_family": "JetBrains Mono",
    "font_size": 14
  }
}
```

### [Font Ligatures](https://zed.dev/docs/appearance.html#font-ligatures)

To disable font ligatures:

```
{
  "buffer_font_features": {
    "calt": false
  }
}
```

### [Line Height](https://zed.dev/docs/appearance.html#line-height)

Adjust line spacing with `buffer_line_height`:

* `"comfortable"` — 1.618 ratio (default)
* `"standard"` — 1.3 ratio
* `{ "custom": 1.5 }` — Custom ratio

## [UI Elements](https://zed.dev/docs/appearance.html#ui-elements)

Zed provides extensive control over UI elements including:

* **Tab bar** — Show/hide, navigation buttons, file icons, git status
* **Status bar** — Language selector, cursor position, line endings
* **Scrollbar** — Visibility, git diff indicators, search results
* **Minimap** — Code overview display
* **Gutter** — Line numbers, fold indicators, breakpoints
* **Panels** — Project Panel, Terminal, Agent Panel sizing and docking

→ [Visual Customization documentation](https://zed.dev/docs/visual-customization.html) for all UI element settings

## [What's Next](https://zed.dev/docs/appearance.html#whats-next)

* [All Settings](https://zed.dev/docs/reference/all-settings.html) — Complete settings reference
* [Key bindings](https://zed.dev/docs/key-bindings.html) — Customize keyboard shortcuts
* [Vim Mode](https://zed.dev/docs/vim.html) — Enable modal editing

[Linux](https://zed.dev/docs/linux.html "Linux")
[Themes](https://zed.dev/docs/themes.html "Themes")
