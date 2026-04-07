---
title: "Set Cursor Style (DECSCUSR) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/decscusr"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Set Cursor Style (DECSCUSR)](https://ghostty.org/docs/vt/csi/decscusr.html)

# Set Cursor Style (DECSCUSR)

Set the cursor style.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x20
5. 0x71
   :   q

If `n` is omitted, `n` defaults to `0`. `n` must be an integer between
0 and 6 (inclusive). The mapping of `n` to cursor style is below:

| n | style |
| --- | --- |
| 0 | terminal default |
| 1 | blinking block |
| 2 | steady block |
| 3 | blinking underline |
| 4 | steady underline |
| 5 | blinking vertical bar |
| 6 | steady vertical bar |

For `n = 0`, the terminal default is up to the terminal and is inconsistent
across terminal implementations. The default may also be impacted by terminal
configuration.



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/decscusr.mdx)
