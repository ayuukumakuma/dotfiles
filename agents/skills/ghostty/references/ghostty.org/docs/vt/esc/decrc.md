---
title: "Restore Cursor (DECRC) - ESC"
source_url: "https://ghostty.org/docs/vt/esc/decrc"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* ESC
* [Restore Cursor (DECRC)](https://ghostty.org/docs/vt/esc/decrc.html)

# Restore Cursor (DECRC)

Restore the cursor-related state saved via Save Cursor (DECSC).

1. 0x1B
   :   ESC
2. 0x38
   :   8

If a cursor was never previously saved, this sets all the typically saved
values to their default values.

## Validation

Validation is shared with [Save Cursor (DECSC)](https://ghostty.org/docs/vt/esc/decsc.html).



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/esc/decrc.mdx)
