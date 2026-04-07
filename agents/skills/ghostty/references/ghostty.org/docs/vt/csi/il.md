---
title: "Insert Line (IL) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/il"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Insert Line (IL)](https://ghostty.org/docs/vt/csi/il.html)

# Insert Line (IL)

Insert blank lines at the current cursor position.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x4C
   :   L

Inserts `n` lines at the current cursor position and shifts existing
lines down.

The parameter `n` must be an integer greater than or equal to 1. If `n` is less than
or equal to 0, adjust `n` to be 1. If `n` is omitted, `n` defaults to 1.

If the current cursor position is outside of the current scroll region,
this sequence does nothing. The cursor is outside of the current scroll
region if it is above the [top margin](https://ghostty.org/docs/vt/csi/il.html#TODO), below the [bottom margin](https://ghostty.org/docs/vt/csi/il.html#TODO),
left of the [left margin](https://ghostty.org/docs/vt/csi/il.html#TODO), or right of the [right margin](https://ghostty.org/docs/vt/csi/il.html#TODO).

This sequence unsets the pending wrap state.

This sequence moves the cursor column to the left margin.

From the current cursor row down `n` lines, insert blank lines colored
with a background color according to the current SGR state. When a line is
inserted, shift all existing content down one line. The bottommost row
is the bottom margin. If content is shifted beyond the bottom margin,
it is lost and the existing content beyond the bottom margin is preserved
and not shifted.

If a [left margin](https://ghostty.org/docs/vt/csi/il.html#TODO) or [right margin](https://ghostty.org/docs/vt/csi/il.html#TODO) is set, only the cells
within and including the margins are blanked (when inserted) or shifted.
Other existing contents to the left of the left margin or right of the
right margin remains untouched.

If a multi-cell character would be split, erase the full multi-cell
character. For example, if "橋" is printed to the left of the left margin
and shifting the line down as a result of IL would split the character,
the cell should be erased.

## Validation

### IL V-1: Simple Insert Line

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "\033[2;2H"
printf "\033[L"
```

```
|ABC_____|
|c_______|
|DEF_____|
|GHI_____|
```

### IL V-2: Cursor Outside of Scroll Region

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "\033[3;4r" # scroll region top/bottom
printf "\033[2;2H"
printf "\033[L"
```

```
|ABC_____|
|DEF_____|
|GHI_____|
```

### IL V-3: Top/Bottom Scroll Regions

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "123\n"
printf "\033[1;3r" # scroll region top/bottom
printf "\033[2;2H"
printf "\033[L"
```

```
|ABC_____|
|c_______|
|DEF_____|
|123_____|
```

### IL V-4: Left/Right Scroll Regions

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC123\n"
printf "DEF456\n"
printf "GHI789\n"
printf "\033[?69h" # enable left/right margins
printf "\033[2;4s" # scroll region left/right
printf "\033[2;2H"
printf "\033[L"
```

```
|ABC123__|
|Dc__56__|
|GEF489__|
|_HI7____|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/il.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/il.html#validation)
* [IL V-1: Simple Insert Line](https://ghostty.org/docs/vt/csi/il.html#il-v-1:-simple-insert-line)
* [IL V-2: Cursor Outside of Scroll Region](https://ghostty.org/docs/vt/csi/il.html#il-v-2:-cursor-outside-of-scroll-region)
* [IL V-3: Top/Bottom Scroll Regions](https://ghostty.org/docs/vt/csi/il.html#il-v-3:-topbottom-scroll-regions)
* [IL V-4: Left/Right Scroll Regions](https://ghostty.org/docs/vt/csi/il.html#il-v-4:-leftright-scroll-regions)
