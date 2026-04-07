---
title: "Erase Character (ECH) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/ech"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Erase Character (ECH)](https://ghostty.org/docs/vt/csi/ech.html)

# Erase Character (ECH)

Blank `n` cells beginning with and including the cursor through to
the right of the cursor.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x58
   :   X

The parameter `n` must be an integer greater than or equal to 1. If `n` is less than
or equal to 0, adjust `n` to be 1. If `n` is omitted, `n` defaults to 1.

The rightmost column that can be erased is the rightmost column of the screen.
The [right margin](https://ghostty.org/docs/vt/csi/ech.html) has no effect on this sequence.

This sequence always unsets the pending wrap state. If the row under the cursor
is soft-wrapped, then the soft-wrap state is also reset.

For `n` cells up to the rightmost column, blank the cell by replacing it
with an empty character with the background color colored according to the
current SGR state. No other SGR attributes are preserved.

If a multi-cell character would be split, erase the full multi-cell
character. For example, if "橋" is printed and ECH `n = 1` is issued,
the full character should be erased even though it takes up two cells.
Both erased cells are colored with the current background color according
to the current SGR state.

If [Select Character Selection Attribute (DECSCA)](https://ghostty.org/docs/vt/csi/ech.html#TODO) is enabled
or was the most recently enabled protection mode on the currently active screen,
protected attributes are ignored as if they were never set and the cells
with them are erased. It does not matter if DECSCA is currently disabled,
protected attributes are still ignored so long as DECSCA was the
*most recently enabled* protection mode.

If DECSCA is not currently enabled and was not the most recently enabled protection
mode on the currently active screen, cells with the protected attribute set are
respected and not erased but still count towards `n`. It does not matter if the
protection attribute for a cell was originally set from DECSCA.

## Validation

### ECH V-1: Simple Operation

```
printf "ABC"
printf "\033[1G"
printf "\033[2X"
```

```
|c_C_____|
```

### ECH V-2: Erasing Beyond Edge of Screen

```
cols=$(tput cols)
printf "\033[${cols}G"
printf "\033[2D"
printf "ABC"
printf "\033[D"
printf "\033[10X"
```

```
|_____Ac_|
```

### ECH V-3: Reset Pending Wrap State

```
cols=$(tput cols)
printf "\033[${cols}G" # move to last column
printf "A" # set pending wrap state
printf "\033[X"
printf "X"
```

```
|_______Xc
```

### ECH V-4: SGR State

```
printf "ABC"
printf "\033[1G"
printf "\033[41m"
printf "\033[2X"
```

```
|c_C_____|
```

The `c_` cells should both have a red background. All other cells
remain unchanged in style.

### ECH V-5: Multi-cell Character

```
printf "橋BC"
printf "\033[1G"
printf "\033[X"
printf "X"
```

```
|XcBC____|
```

### ECH V-6: Left/Right Scroll Region Ignored

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?69h" # enable left/right margins
printf "\033[1;3s" # scroll region left/right
printf "\033[4G"
printf "ABC"
printf "\033[1G"
printf "\033[4X"
```

```
|c___BC____|
```

### ECH V-7: Protected Attributes Ignored with DECSCA

```
printf "\033V"
printf "ABC"
printf "\033[1\"q"
printf "\033[0\"q"
printf "\033[1G"
printf "\033[2X"
```

```
|c_C_______|
```

### ECH V-8: Protected Attributes Respected without DECSCA

```
printf "\033[1\"q"
printf "ABC"
printf "\033V"
printf "\033[1G"
printf "\033[2X"
```

```
|ABC_______|
```

The cursor remains at `A`.



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/ech.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/ech.html#validation)
* [ECH V-1: Simple Operation](https://ghostty.org/docs/vt/csi/ech.html#ech-v-1:-simple-operation)
* [ECH V-2: Erasing Beyond Edge of Screen](https://ghostty.org/docs/vt/csi/ech.html#ech-v-2:-erasing-beyond-edge-of-screen)
* [ECH V-3: Reset Pending Wrap State](https://ghostty.org/docs/vt/csi/ech.html#ech-v-3:-reset-pending-wrap-state)
* [ECH V-4: SGR State](https://ghostty.org/docs/vt/csi/ech.html#ech-v-4:-sgr-state)
* [ECH V-5: Multi-cell Character](https://ghostty.org/docs/vt/csi/ech.html#ech-v-5:-multi-cell-character)
* [ECH V-6: Left/Right Scroll Region Ignored](https://ghostty.org/docs/vt/csi/ech.html#ech-v-6:-leftright-scroll-region-ignored)
* [ECH V-7: Protected Attributes Ignored with DECSCA](https://ghostty.org/docs/vt/csi/ech.html#ech-v-7:-protected-attributes-ignored-with-decsca)
* [ECH V-8: Protected Attributes Respected without DECSCA](https://ghostty.org/docs/vt/csi/ech.html#ech-v-8:-protected-attributes-respected-without-decsca)
