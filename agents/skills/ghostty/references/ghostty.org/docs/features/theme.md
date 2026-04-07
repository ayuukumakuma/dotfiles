---
title: "Color Theme - Features"
source_url: "https://ghostty.org/docs/features/theme"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Features](https://ghostty.org/docs/features.html)
* [Color Theme](https://ghostty.org/docs/features/theme.html)

# Color Theme

Ghostty supports full customization of the color theme,
ships with hundreds of built-in themes, supports custom themes
for light and dark mode, and more.

## Built-in Themes

Ghostty ships with hundreds of built-in themes that can be selected
with one line of configuration by using the [`theme` configuration option](https://ghostty.org/docs/config/reference.html#theme). For example, to use the popular Catppuccin theme:

```
theme = Catppuccin Frappe
```

> Tip
>
> Don't forget to [reload your configuration](https://ghostty.org/docs/config.html#reloading-the-configuration)
> after changing the theme.

The built-in themes are sourced from
[iterm2-color-schemes](https://iterm2colorschemes.com) and
updated in the Ghostty repository on the main branch weekly.
If you want to contribute a new theme, please contribute it to
iterm2-color-schemes and it will be automatically picked up by
Ghostty.

### Listing Available Themes

To see a list of available themes, you can use the `+list-themes` CLI:

```
ghostty +list-themes
```

For built-in themes, you can also view the theme list online
at [iterm2-color-schemes](https://iterm2colorschemes.com). This
also includes a preview of each theme.

## Separate Light and Dark Themes

Ghostty supports specifying separate light and dark themes.

```
theme = dark:Catppuccin Frappe,light:Catppuccin Latte
```

When separate light and dark themes are specified, Ghostty will
automatically switch between the light and dark theme based on
the system appearance.

## Authoring a Custom Theme

Themes are no different than any other configuration file
in Ghostty; they just happen to typically only set color options.
However, a theme file *could* set any configuration option such
as cursor styles, fonts, etc.

> Warning
>
> Themes can modify any configuration option, so be careful
> when using themes from untrusted sources. Always review the
> theme file before using it to ensure it doesn't contain
> malicious configuration.

The primary difference between a theme file and a regular
configuration file is how it is loaded. Themes are loaded
*first* and any conflicting options in the user configuration
will override the theme (versus
[`config-file`](https://ghostty.org/docs/config/reference.html#config-file)
which is loaded *after* the user configuration).

To author a custom theme, create a new file and set the
following options:

* [`background`](https://ghostty.org/docs/config/reference.html#background)
* [`foreground`](https://ghostty.org/docs/config/reference.html#foreground)
* [`cursor-color`](https://ghostty.org/docs/config/reference.html#cursor-color)
* [`selection-foreground`](https://ghostty.org/docs/config/reference.html#selection-foreground)
* [`selection-background`](https://ghostty.org/docs/config/reference.html#selection-background)
* [`palette`](https://ghostty.org/docs/config/reference.html#palette)

### File Location

Theme files can be located anywhere on the filesystem. The
[`theme`](https://ghostty.org/docs/config/reference.html#theme) configuration option allows
for absolute paths. However, if you want to reference a theme by
name, they have to be located in specific directories.

Theme lookup by name searches two directories:

1. `$XDG_CONFIG_HOME/ghostty/themes`
2. `$PREFIX/share/ghostty/themes`

### Example

Below is an example of a complete theme file:

```
palette = 0=#51576d
palette = 1=#e78284
palette = 2=#a6d189
palette = 3=#e5c890
palette = 4=#8caaee
palette = 5=#f4b8e4
palette = 6=#81c8be
palette = 7=#a5adce
palette = 8=#626880
palette = 9=#e67172
palette = 10=#8ec772
palette = 11=#d9ba73
palette = 12=#7b9ef0
palette = 13=#f2a4db
palette = 14=#5abfb5
palette = 15=#b5bfe2
background = #303446
foreground = #c6d0f5
cursor-color = #f2d5cf
cursor-text = #c6d0f5
selection-background = #626880
selection-foreground = #c6d0f5
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/features/theme.mdx)

* [Built-in Themes](https://ghostty.org/docs/features/theme.html#built-in-themes)
* [Listing Available Themes](https://ghostty.org/docs/features/theme.html#listing-available-themes)
* [Separate Light and Dark Themes](https://ghostty.org/docs/features/theme.html#separate-light-and-dark-themes)
* [Authoring a Custom Theme](https://ghostty.org/docs/features/theme.html#authoring-a-custom-theme)
* [File Location](https://ghostty.org/docs/features/theme.html#file-location)
* [Example](https://ghostty.org/docs/features/theme.html#example)
