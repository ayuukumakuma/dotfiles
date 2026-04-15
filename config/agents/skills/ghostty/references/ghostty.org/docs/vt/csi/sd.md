---
title: "Scroll Down (SD) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/sd"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Scroll Down (SD)](https://ghostty.org/docs/vt/csi/sd.html)

# Scroll Down (SD)

Insert `n` lines at the top of the scroll region and
shift existing lines down.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x54
   :   T

This sequence is functionally identical to
[Insert Line (IL)](https://ghostty.org/docs/vt/csi/il.html) with the cursor position set to the top of
the scroll region. The cursor position after the operation must be unchanged
from when SD was invoked.

This sequence unsets the pending wrap state.

## Validation

### SD V-1: Outside of Top/Bottom Scroll Region

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "\033[3;4r" # scroll region top/bottom
printf "\033[2;2H"
printf "\033[T"
```

```
|ABC_____|
|DEF_____|
|________|
|GHI_____|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/sd.mdx)
