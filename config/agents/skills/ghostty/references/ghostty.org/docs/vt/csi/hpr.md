---
title: "Horizontal Position Relative (HPR) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/hpr"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Horizontal Position Relative (HPR)](https://ghostty.org/docs/vt/csi/hpr.html)

# Horizontal Position Relative (HPR)

Move the cursor to a specific column relative to the current position.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   x
4. 0x61
   :   a

This sequence performs [cursor position (CUP)](https://ghostty.org/docs/vt/csi/cup.html) with `x` set
to the current cursor column plus `x` and `y` set to the current cursor row.
There is no additional or different behavior for using `HPR`.

The parameter `x` must be an integer greater than or equal to 1. If `x` is less than
or equal to 0, adjust `x` to be 1. If `x` is omitted, `x` defaults to 1.

Because this invokes `CUP`, the cursor row (`y`) can change if it is
outside the bounds of the `CUP` operation. For example, if
[origin mode](https://ghostty.org/docs/vt/csi/hpr.html#TODO) is set and the current cursor position is outside
of the scroll region, the row will be adjusted.



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/hpr.mdx)
