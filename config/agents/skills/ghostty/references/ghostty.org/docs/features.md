---
title: "Features"
source_url: "https://ghostty.org/docs/features"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Features](https://ghostty.org/docs/features.html)

# Features

The features Ghostty supports and associated documentation.

Ghostty is a very feature-rich terminal.

Terminal features can be divided into two categories: features for
end-users and features for terminal application developers.

Features for end-users are things like multi-window, tabs, splits, ligatures,
auto-update, etc. These are features that make using a terminal
more pleasant without requiring any changes to the running terminal
applications (such as your shell, text editor, etc.).

Features for terminal application developers are things like the
Kitty graphics protocol, Kitty keyboard protocol, synchronized
rendering, light/dark mode notifications, etc. These features allow
terminal applications to do more than they could in other terminal
emulators. While these features are not directly used by end-users,
end-users benefit from them because terminal applications they use
every day can do more.

## Feature Highlight

Here is a list highlighting some of the larger or more interesting
features that Ghostty supports:

* **Cross-platform**: Ghostty runs on macOS and Linux. It uses native
  UI components on each platform to provide an idiomatic experience.
  Windows support is planned for the future.
* **Windows, tabs, and splits**: Ghostty supports multiple windows,
  each with its own tabs and splits. These are all rendered using
  native UI components.
* **GPU-accelerated rendering**: Ghostty uses Metal on macOS and
  OpenGL on Linux to render the terminal screen.
* **Themes**: Ghostty ships with hundreds of themes that can be
  selected with a single line of configuration. Themes can be
  switched automatically based on system dark/light mode. Users
  can author their own themes.
* **Ligatures**: You can use fonts that have ligatures and Ghostty
  will render them correctly. You can also specify specific font
  features to enable or disable.
* **Grapheme clustering**: Multi-codepoint emoji such as flags,
  skin tones, etc. are rendered correctly as a single character.
  Individual grapheme clusters in certain right-to-left scripts
  like Arabic and Hebrew are also rendered correctly, although
  only left-to-right text is supported.
* **Kitty graphics protocol**: Ghostty supports the Kitty graphics
  protocol, which allows terminal applications to render images
  directly in the terminal.

### Platform-Native Features

One of the primary [design goals](https://ghostty.org/docs/about.html) of Ghostty is to
look, feel, and behave like a purpose-built native application
on each platform.
Here is a list of some of the platform-native features that Ghostty has.

### macOS

* **Quick Terminal**: Lightweight terminal that animates down below the
  menu bar for instant access without interrupting work.
* **AppleScript Automation**: Built-in AppleScript dictionary for scripting
  windows, tabs, terminals, layouts, and input events. See
  [AppleScript docs](https://ghostty.org/docs/features/applescript.html).
* **Native Tabs, Splits, etc.**: We use native macOS components for
  UI elements such as tabs and splits as opposed to custom-drawn
  text such as other terminal emulators.
* **Proxy Icon**: Drag the proxy icon in the title bar to move or
  access terminal session files, or navigate to the file path directly.
* **Quick Look**: Tap text with three fingers or force touch to use macOS
  Quick Look for definitions, web searches, and more.
* **Secure Keyboard Entry**: Automatically detect password prompts
  or manually enable secure keyboard entry to protect passwords from
  other processes. You can know when secure keyboard entry is active
  because an animated lock icon appears in the top-right corner of the
  terminal.

## Terminal (VT) Features

For terminal application developers, we believe Ghostty is one of
the most modern and comprehensive terminal emulators available[1](https://ghostty.org/docs/features.html#user-content-fn-1).
Our goal with Ghostty is to be the most compatible for legacy
applications while also providing the most modern features for
new applications.

What that means in practice is that Ghostty supports a wide range
of control sequences, terminal features, and terminal protocols.
And to determine the behavior of these features, we follow
the following principles:

1. Xterm compatibility: xterm is the de facto standard for
   terminal emulation. If xterm does something, we should do
   the same thing[2](https://ghostty.org/docs/features.html#user-content-fn-2).
2. Protocol origin compatibility: If the terminal that defined
   a protocol behaves a certain way, we should follow that behavior,
   even if it is not specified[3](https://ghostty.org/docs/features.html#user-content-fn-3).
3. Defacto standard compatibility: If a behavior is widely
   accepted as the standard, we should follow that behavior.
   "Widely accepted" is generally subjective based on popular
   opinion and usage.

For a list of terminal developer features Ghostty supports, see the
[reference](https://ghostty.org/docs/vt/reference.html)
(but note at the time of writing this is still a work-in-progress).

## Footnotes

1. If not, we want to know! Please
   [open a discussion](https://github.com/ghostty-org/ghostty/discussions). [↩](https://ghostty.org/docs/features.html#user-content-fnref-1)
2. We may put some xterm behaviors behind a configuration flag if
   the behavior is questionable or not widely accepted. [↩](https://ghostty.org/docs/features.html#user-content-fnref-2)
3. If a behavior differs between the specification and the terminal that defined the protocol, we open a discussion to determine the correct behavior. [↩](https://ghostty.org/docs/features.html#user-content-fnref-3)



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/features/index.mdx)

* [Feature Highlight](https://ghostty.org/docs/features.html#feature-highlight)
* [Platform-Native Features](https://ghostty.org/docs/features.html#platform-native-features)
* [macOS](https://ghostty.org/docs/features.html#macos)
* [Terminal (VT) Features](https://ghostty.org/docs/features.html#terminal-(vt)-features)
