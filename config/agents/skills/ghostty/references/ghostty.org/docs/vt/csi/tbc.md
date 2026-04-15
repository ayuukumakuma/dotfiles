---
title: "Tab Clear (TBC) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/tbc"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Tab Clear (TBC)](https://ghostty.org/docs/vt/csi/tbc.html)

# Tab Clear (TBC)

Clear one or all tab stops.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x67
   :   g

The parameter `n` must be `0` or `3`. If `n` is omitted, `n` defaults to `0`.

If the parameter `n` is `0`, the cursor column position is marked as
not a tab stop. If the column was already not a tab stop, this does nothing.

If the parameter `n` is `3`, all tab stops are cleared.

## Validation

### TBC V-1: Tab Clear Single

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?5W" # reset tabs
printf "\t"
printf "\033[g"
printf "\033[1G"
printf "\t"
```

```
|_______________c_______|
```

### TBC V-3: Clear All Tabstops

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?5W" # reset tabs
printf "\033[3g"
printf "\033[1G"
printf "\t"
```

```
|______________________c|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/tbc.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/tbc.html#validation)
* [TBC V-1: Tab Clear Single](https://ghostty.org/docs/vt/csi/tbc.html#tbc-v-1:-tab-clear-single)
* [TBC V-3: Clear All Tabstops](https://ghostty.org/docs/vt/csi/tbc.html#tbc-v-3:-clear-all-tabstops)
