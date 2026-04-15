---
title: "Index (IND) - ESC"
source_url: "https://ghostty.org/docs/vt/esc/ind"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* ESC
* [Index (IND)](https://ghostty.org/docs/vt/esc/ind.html)

# Index (IND)

Move the cursor down one cell, scrolling if necessary.

1. 0x1B
   :   ESC
2. 0x44
   :   D

This sequence always unsets the pending wrap state.

If the cursor is exactly on the bottom margin and is at or within the
[left](https://ghostty.org/docs/vt/esc/ind.html#TODO) and [right margin](https://ghostty.org/docs/vt/esc/ind.html#TODO), [scroll up](https://ghostty.org/docs/vt/esc/ind.html#TODO) one line.
If the scroll region is the full terminal screen and the terminal is on
the [primary screen](https://ghostty.org/docs/vt/esc/ind.html#TODO), this may create scrollback. See the
[scroll](https://ghostty.org/docs/vt/esc/ind.html#TODO) documentation for more details.

If the cursor is outside of the scroll region or not on the bottom
margin of the scroll region, perform the [cursor down](https://ghostty.org/docs/vt/csi/cud.html) operation with
`n = 1`.

This sequence will only scroll when the cursor is exactly on the bottom
margin and within the remaining scroll region. If the cursor is outside
the scroll region and on the bottom line of the terminal, the cursor
does not move.

## Validation

### IND V-1: No Scroll Region, Top of Screen

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "A"
printf "\033D" # index
printf "X"
```

```
|A_________|
|_Xc_______|
```

### IND V-2: Bottom of Primary Screen

```
lines=$(tput lines)
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[${lines};1H" # move to bottom-left
printf "A"
printf "\033D" # index
printf "X"
```

```
|A_________|
|_Xc_______|
```

### IND V-3: Inside Scroll Region

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[1;3r" # scroll region
printf "A"
printf "\033D" # index
printf "X"
```

```
|A_________|
|_Xc_______|
```

### IND V-4: Bottom of Scroll Region

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[1;3r" # scroll region
printf "\033[4;1H" # below scroll region
printf "B"
printf "\033[3;1H" # move to last row of region
printf "A"
printf "\033D" # index
printf "X"
```

```
|__________|
|A_________|
|_Xc_______|
|B_________|
```

### IND V-5: Bottom of Primary Screen with Scroll Region

```
lines=$(tput lines)
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[1;3r" # scroll region
printf "\033[3;1H" # move to last row of region
printf "A"
printf "\033[${lines};1H" # move to bottom-left
printf "\033D" # index
printf "X"
```

```
|__________|
|__________|
|A_________|
|__________|
|Xc________|
```

### IND V-6: Outside of Left/Right Scroll Region

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?69h" # enable left/right margins
printf "\033[1;3r" # scroll region top/bottom
printf "\033[3;5s" # scroll region left/right
printf "\033[3;3H"
printf "A"
printf "\033[3;1H"
printf "\033D" # index
printf "X"
```

```
|__________|
|__________|
|XcA_______|
```

### IND V-7: Inside of Left/Right Scroll Region

```
printf "\033[1;1H" # move to top-left
printf "\033[0J"   # clear screen
printf "AAAAAA\n"
printf "AAAAAA\n"
printf "AAAAAA"
printf "\033[?69h" # enable left/right margins
printf "\033[1;3s" # set scroll region left/right
printf "\033[1;3r" # set scroll region top/bottom
printf "\033[3;1H" # Move to bottom left
printf "\033D" # index
```

```
|AAAAAA____|
|AAAAAA____|
|c__AAA____|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/esc/ind.mdx)

* [Validation](https://ghostty.org/docs/vt/esc/ind.html#validation)
* [IND V-1: No Scroll Region, Top of Screen](https://ghostty.org/docs/vt/esc/ind.html#ind-v-1:-no-scroll-region-top-of-screen)
* [IND V-2: Bottom of Primary Screen](https://ghostty.org/docs/vt/esc/ind.html#ind-v-2:-bottom-of-primary-screen)
* [IND V-3: Inside Scroll Region](https://ghostty.org/docs/vt/esc/ind.html#ind-v-3:-inside-scroll-region)
* [IND V-4: Bottom of Scroll Region](https://ghostty.org/docs/vt/esc/ind.html#ind-v-4:-bottom-of-scroll-region)
* [IND V-5: Bottom of Primary Screen with Scroll Region](https://ghostty.org/docs/vt/esc/ind.html#ind-v-5:-bottom-of-primary-screen-with-scroll-region)
* [IND V-6: Outside of Left/Right Scroll Region](https://ghostty.org/docs/vt/esc/ind.html#ind-v-6:-outside-of-leftright-scroll-region)
* [IND V-7: Inside of Left/Right Scroll Region](https://ghostty.org/docs/vt/esc/ind.html#ind-v-7:-inside-of-leftright-scroll-region)
