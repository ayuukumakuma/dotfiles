---
title: "Reset to Initial State (RIS) - ESC"
source_url: "https://ghostty.org/docs/vt/esc/ris"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* ESC
* [Reset to Initial State (RIS)](https://ghostty.org/docs/vt/esc/ris.html)

# Full Reset (RIS)

Reset the terminal to its initial state.

1. 0x1B
   :   ESC
2. 0x63
   :   c

The full reset operation does the following:

* Set the cursor shape to the default
* Reset the scroll region to the full screen
* Disable [left and right margin mode (mode 69)](https://ghostty.org/docs/vt/esc/ris.html#TODO)
* Disable [origin mode (mode 6)](https://ghostty.org/docs/vt/esc/ris.html#TODO)
* Unset cursor foreground and background colors
* Reset charsets to the default
* Reset [cursor key mode (DECCKM)](https://ghostty.org/docs/vt/esc/ris.html#TODO)
* Reset [disable keyboard input (KAM)](https://ghostty.org/docs/vt/esc/ris.html#TODO)
* Reset [application keypad mode](https://ghostty.org/docs/vt/esc/deckpnm.html)
* Reset xterm keyboard modifier state to the default
* Disable cursor [protected attribute](https://ghostty.org/docs/vt/esc/ris.html#TODO)
* Disable any [protected area](https://ghostty.org/docs/vt/esc/ris.html#TODO)
* Reset all [mouse tracking modes](https://ghostty.org/docs/vt/esc/ris.html#TODO)
* Reset tabstops to default
* Enable [send-receive mode (mode 12)](https://ghostty.org/docs/vt/esc/ris.html#TODO)
* Reset [backspace sends delete (mode 67)](https://ghostty.org/docs/vt/esc/ris.html#TODO)
* Return to the primary screen and clear it
* Move the cursor to the top-left corner
* Reset the pending wrap state
* Reset saved cursor state



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/esc/ris.mdx)
