---
title: "macOS Tiling Window Managers - Help"
source_url: "https://ghostty.org/docs/help/macos-tiling-wms"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Help](https://ghostty.org/docs/help.html)
* [macOS Tiling Window Managers](https://ghostty.org/docs/help/macos-tiling-wms.html)

# macOS Tiling Window Managers

Ghostty tabs may render as separate windows in macOS tiling
window managers such as Yabai or Aerospace.

macOS tiling window managers such as Yabai or Aerospace may
render Ghostty tabs as separate windows. This is a known issue
that is well documented in both the Yabai and Aerospace
issue trackers.

Ghostty uses macOS native tabs. macOS native tabs are represented
as separate windows in the macOS window manager API. This is
the API that Yabai, Aerospace, and other tiling window managers
use to manage windows on macOS.

As such, this is a limitation of macOS APIs and there isn't
anything Ghostty can do to fix this issue.

> Note
>
> Longer term, we'd like to implement a custom tabbing solution
> that doesn't rely on macOS native tabs. This would allow us
> to better integrate with macOS tiling window managers.

## Workarounds

The Ghostty community has identified potential workarounds
depending on the tiling window manager you are using.

### Aerospace

```
[[on-window-detected]]
if.app-id="com.mitchellh.ghostty"
run= [
  "layout tiling",
]
```

If Ghostty tabs are still being rendered as separate windows, try replacing `"layout tiling"` with `"layout floating"`. Note that this will cause the Ghostty window to be floating on initial startup. You can manually unfloat the window (`alt+shift+;` followed by `f` by default).

### Yabai

```
yabai -m signal --add app='^Ghostty$' event=window_created action='yabai -m space --layout bsp'
yabai -m signal --add app='^Ghostty$' event=window_destroyed action='yabai -m space --layout bsp'
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/help/macos-tiling-wms.mdx)

* [Workarounds](https://ghostty.org/docs/help/macos-tiling-wms.html#workarounds)
* [Aerospace](https://ghostty.org/docs/help/macos-tiling-wms.html#aerospace)
* [Yabai](https://ghostty.org/docs/help/macos-tiling-wms.html#yabai)
