---
title: "Icon Themes | Icon Themes"
source_url: "https://zed.dev/docs/icon-themes"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Icon Themes](https://zed.dev/docs/icon-themes.html#icon-themes)

Zed comes with a built-in icon theme, with more icon themes available as extensions.

## [Selecting an Icon Theme](https://zed.dev/docs/icon-themes.html#selecting-an-icon-theme)

See what icon themes are installed and preview them via the Icon Theme Selector, which you can open from the command palette with `icon theme selector: toggle`.

Navigating through the icon theme list by moving up and down will change the icon theme in real time and hitting enter will save it to your settings file.

## [Installing more Icon Themes](https://zed.dev/docs/icon-themes.html#installing-more-icon-themes)

More icon themes are available from the Extensions page, which you can access via the command palette with `zed: extensions` or the [Zed website](https://zed.dev/extensions?filter=icon-themes).

## [Configuring Icon Themes](https://zed.dev/docs/icon-themes.html#configuring-icon-themes)

Your selected icon theme is stored in your settings file.
You can open your settings file from the command palette with `zed: open settings file` (bound to `cmd-alt-,|ctrl-alt-,`).

Just like with themes, Zed allows for configuring different icon themes for light and dark mode.
You can set the mode to `"light"` or `"dark"` to ignore the current system mode.

```
{
  "icon_theme": {
    "mode": "system",
    "light": "Light Icon Theme",
    "dark": "Dark Icon Theme"
  }
}
```

## [Icon Theme Development](https://zed.dev/docs/icon-themes.html#icon-theme-development)

See: [Developing Zed Icon Themes](https://zed.dev/docs/extensions/icon-themes.html)

[Themes](https://zed.dev/docs/themes.html "Themes")
[Fonts & Visual Tweaks](https://zed.dev/docs/visual-customization.html "Fonts & Visual Tweaks")
