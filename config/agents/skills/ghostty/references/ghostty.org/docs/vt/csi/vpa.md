---
title: "Vertical Position Absolute (VPA) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/vpa"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Vertical Position Absolute (VPA)](https://ghostty.org/docs/vt/csi/vpa.html)

# Vertical Position Absolute (VPA)

Move the cursor to a specific row.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   y
4. 0x64
   :   d

This sequence performs [cursor position (CUP)](https://ghostty.org/docs/vt/csi/cup.html) with `y` set
to the parameterized value and `x` set to the current cursor position.
There is no additional or different behavior for using `VPA`.

Because this invokes `CUP`, the cursor column (`y`) can change if it is
outside the bounds of the `CUP` operation. For example, if
[origin mode](https://ghostty.org/docs/vt/csi/vpa.html#TODO) is set and the current cursor position is outside
of the scroll region, the column will be adjusted.



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/vpa.mdx)
