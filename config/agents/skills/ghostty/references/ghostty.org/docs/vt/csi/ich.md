---
title: "Insert Character (ICH) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/ich"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Insert Character (ICH)](https://ghostty.org/docs/vt/csi/ich.html)

# Insert Character (ICH)

Insert blank characters at the current cursor position.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x40
   :   @

Insert `n` blank characters at the current cursor position and shift
existing cell contents right.

The parameter `n` must be an integer greater than or equal to 1. If `n` is less than
or equal to 0, adjust `n` to be 1. If `n` is omitted, `n` defaults to 1.

This sequence always unsets the pending wrap state.

If the cursor position is outside of the [left and right margins](https://ghostty.org/docs/vt/csi/ich.html#TODO),
this sequence does not change the screen, but the pending wrap state is
still reset.

Existing cells shifted beyond the right margin are deleted. Inserted cells
are blank with the background color colored according to the current SGR state.

If a multi-cell character (such as "橋") is shifted so that the cell is split
in half, the multi-cell character can either be clipped or erased. Typical
behavior is to clip at the right edge of the screen and erase at a right
margin, but either behavior is acceptable.

## Validation

### ICH V-1: No Scroll Region, Fits on Screen

```
printf "ABC"
printf "\033[1G"
printf "\033[2@"
printf "X"
```

```
|XcABC_____|
```

### ICH V-2: SGR State

```
printf "ABC"
printf "\033[1G"
printf "\033[41m"
printf "\033[2@"
printf "X"
```

```
|c_ABC_____|
```

The `c_` cells should both have a red background. The `ABC` cells should
remain unchanged in style.

### ICH V-3: Shifting Content Off the Screen

```
cols=$(tput cols)
printf "\033[${cols}G"
printf "\033[2D"
printf "ABC"
printf "\033[2D"
printf "\033[2@"
printf "X"
```

```
|_______XcA|
```

### ICH V-4: Inside Left/Right Scroll Region

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?69h" # enable left/right margins
printf "\033[3;5s" # scroll region left/right
printf "\033[3G"
printf "ABC"
printf "\033[3G"
printf "\033[2@"
printf "X"
```

```
|__XcA_____|
```

### ICH V-5: Outside Left/Right Scroll Region

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?69h" # enable left/right margins
printf "\033[3;5s" # scroll region left/right
printf "\033[3G"
printf "ABC"
printf "\033[1G"
printf "\033[2@"
printf "X"
```

```
|XcABC_____|
```

### ICH V-6: Split Wide Character

```
cols=$(tput cols)
printf "\033[${cols}G"
printf "\033[1D"
printf "橋"
printf "\033[2D"
printf "\033[@"
printf "X"
```

```
|_______Xc_|
```

In this case, it is valid for the last cell to be blank or to clip the
multi-cell character. xterm clips the character but many other terminals
erase the cell.



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/ich.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/ich.html#validation)
* [ICH V-1: No Scroll Region, Fits on Screen](https://ghostty.org/docs/vt/csi/ich.html#ich-v-1:-no-scroll-region-fits-on-screen)
* [ICH V-2: SGR State](https://ghostty.org/docs/vt/csi/ich.html#ich-v-2:-sgr-state)
* [ICH V-3: Shifting Content Off the Screen](https://ghostty.org/docs/vt/csi/ich.html#ich-v-3:-shifting-content-off-the-screen)
* [ICH V-4: Inside Left/Right Scroll Region](https://ghostty.org/docs/vt/csi/ich.html#ich-v-4:-inside-leftright-scroll-region)
* [ICH V-5: Outside Left/Right Scroll Region](https://ghostty.org/docs/vt/csi/ich.html#ich-v-5:-outside-leftright-scroll-region)
* [ICH V-6: Split Wide Character](https://ghostty.org/docs/vt/csi/ich.html#ich-v-6:-split-wide-character)
