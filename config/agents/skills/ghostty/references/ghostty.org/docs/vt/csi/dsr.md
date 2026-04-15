---
title: "Device Status Report (DSR) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/dsr"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Device Status Report (DSR)](https://ghostty.org/docs/vt/csi/dsr.html)

# Device Status Report (DSR)

Request information from the terminal.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x6E
   :   n

Request information from the terminal depending on the value of `n`.

The possible valid values of `n` are described in the paragraphs below. If
any other value of `n` is provided, this sequence does nothing.

If `n = 5`, the *operating status* is requested. The terminal responds
to the program with `ESC [ 0 n` to indicate no malfunctions.

If `n = 6`, the *cursor position* is requested. The terminal responds to
the program in the format `ESC [ y ; x R` where `y` is the row and `x`
is the column, both one-indexed. If [origin mode (DEC Mode 6)](https://ghostty.org/docs/vt/csi/dsr.html#TODO)
is enabled, the reported cursor position is relative to the top-left of the
scroll region.

## Validation

### DSR V-1: Operating Status

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[5n"
```

```
|^[[0n_____|
```

### DSR V-2: Cursor Position

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[2;4H" # move to top-left
printf "\033[6n"
```

```
^[[2;4R
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/dsr.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/dsr.html#validation)
* [DSR V-1: Operating Status](https://ghostty.org/docs/vt/csi/dsr.html#dsr-v-1:-operating-status)
* [DSR V-2: Cursor Position](https://ghostty.org/docs/vt/csi/dsr.html#dsr-v-2:-cursor-position)
