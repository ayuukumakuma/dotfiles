---
title: "Bell (BEL) - Control"
source_url: "https://ghostty.org/docs/vt/control/bel"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* Control
* [Bell (BEL)](https://ghostty.org/docs/vt/control/bel.html)

# Bell (BEL)

Raise the attention of the user.

1. 0x07
   :   BEL

The purpose of the bell sequence is to raise the attention
of the user.

Historically, this would
[ring a physical bell](https://en.wikipedia.org/wiki/Bell_character).
Today, many alternate behaviors are acceptable:

* An audible sound can be played through the speakers
* Background or border of a window can visually flash
* The terminal window can come into focus or be put on top
* Application icon can bounce or otherwise draw attention
* A desktop notification can be shown

Normally, the bell behavior is configurable and can be disabled.

## BEL as an OSC Terminator

The `BEL` character is also a valid terminating character for
OSC sequences, although `ST` is preferred. If `BEL` is the
terminating character for an OSC sequence, any responses should
also terminate with the `BEL` character.[1](https://ghostty.org/docs/vt/control/bel.html#user-content-fn-1)

## Ghostty Status

This control character is implemented in Ghostty, although by default
most behaviors that Ghostty implements are disabled. See the documentation
for the [`bell-features`](https://ghostty.org/docs/config/reference.html#bell-features) configuration
option for more information.

The BEL character can be used as an OSC terminator. If it is used as an OSC
terminator, Ghostty will terminate any responses with the
`BEL` character.

## Footnotes

1. <https://invisible-island.net/xterm/ctlseqs/ctlseqs.html> [↩](https://ghostty.org/docs/vt/control/bel.html#user-content-fnref-1)



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/control/bel.mdx)
