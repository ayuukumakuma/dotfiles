---
title: "Delete Line (DL) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/dl"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Delete Line (DL)](https://ghostty.org/docs/vt/csi/dl.html)

# Delete Line (DL)

Deletes `n` lines at the current cursor position and shifts existing
lines up.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x4D
   :   M

The parameter `n` must be an integer greater than or equal to 1. If `n` is less than
or equal to 0, adjust `n` to be 1. If `n` is omitted, `n` defaults to 1.

If the current cursor position is outside of the current scroll region,
this sequence does nothing. The cursor is outside of the current scroll
region if it is above the [top margin](https://ghostty.org/docs/vt/csi/dl.html#TODO), below the [bottom margin](https://ghostty.org/docs/vt/csi/dl.html#TODO),
left of the [left margin](https://ghostty.org/docs/vt/csi/dl.html#TODO), or right of the [right margin](https://ghostty.org/docs/vt/csi/dl.html#TODO).

This sequence unsets the pending wrap state.

This sequence moves the cursor column to the left margin.

Remove the top `n` lines of the current scroll region, and shift existing
lines up. The space created at the bottom of the scroll region should be
blank with the background color set according to the current SGR state.

If a [left margin](https://ghostty.org/docs/vt/csi/dl.html#TODO) or [right margin](https://ghostty.org/docs/vt/csi/dl.html#TODO) is set, only the cells
within and including the margins are deleted or shifted.
Other existing contents to the left of the left margin or right of the
right margin remains untouched.

If a multi-cell character would be split, erase the full multi-cell
character. For example, if "橋" is printed to the left of the left margin
and shifting the line down as a result of DL would split the character,
the cell should be erased.

## Validation

### DL V-1: Simple Delete Line

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "\033[2;2H"
printf "\033[M"
```

```
|ABC_____|
|GHI_____|
```

### DL V-2: Cursor Outside of Scroll Region

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "\033[3;4r" # scroll region top/bottom
printf "\033[2;2H"
printf "\033[M"
```

```
|ABC_____|
|DEF_____|
|GHI_____|
```

### DL V-3: Top/Bottom Scroll Regions

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "123\n"
printf "\033[1;3r" # scroll region top/bottom
printf "\033[2;2H"
printf "\033[M"
```

```
|ABC_____|
|GHI_____|
|________|
|123_____|
```

### DL V-4: Left/Right Scroll Regions

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC123\n"
printf "DEF456\n"
printf "GHI789\n"
printf "\033[?69h" # enable left/right margins
printf "\033[2;4s" # scroll region left/right
printf "\033[2;2H"
printf "\033[M"
```

```
|ABC123__|
|DHI756__|
|G___89__|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/dl.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/dl.html#validation)
* [DL V-1: Simple Delete Line](https://ghostty.org/docs/vt/csi/dl.html#dl-v-1:-simple-delete-line)
* [DL V-2: Cursor Outside of Scroll Region](https://ghostty.org/docs/vt/csi/dl.html#dl-v-2:-cursor-outside-of-scroll-region)
* [DL V-3: Top/Bottom Scroll Regions](https://ghostty.org/docs/vt/csi/dl.html#dl-v-3:-topbottom-scroll-regions)
* [DL V-4: Left/Right Scroll Regions](https://ghostty.org/docs/vt/csi/dl.html#dl-v-4:-leftright-scroll-regions)
