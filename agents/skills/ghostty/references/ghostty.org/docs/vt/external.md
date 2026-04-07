---
title: "External Protocols - Terminal API (VT)"
source_url: "https://ghostty.org/docs/vt/external"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* [External Protocols](https://ghostty.org/docs/vt/external.html)

# External Protocols

A list of external protocols that Ghostty supports.

Ghostty inherits the rich tradition of innovation from other terminal
emulators, and many modern, well-written specifications do not need to
be reinvented here. If Ghostty's behavior deviates from these specifications,
we treat them as bugs which will be fixed according to spec.

Note that we may still provide specifications here if upstream behavior is
not well-specified (such is the case for most xterm and [ConEmu](https://ghostty.org/docs/vt/osc/conemu.html) extensions),
or Ghostty intentionally deviates from it for good reason.

Below is a list of protocols that Ghostty supports, which originate from other
terminal emulators:

| Protocol | Specification |
| --- | --- |
| OSC 8 (Hyperlinks) | [VTE and iTerm2](https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda) |
| OSC 21 (Kitty Color Protocol) | [Kitty](https://sw.kovidgoyal.net/kitty/color-stack/) |



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/external.mdx)
