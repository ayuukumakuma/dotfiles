---
title: "Cursor Position (CUP) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/cup"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Cursor Position (CUP)](https://ghostty.org/docs/vt/csi/cup.html)

# Cursor Position (CUP)

Move the cursor to row `y` and column `x`.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   y
4. 0x3B
   :   ;
5. \_\_\_\_
   :   x
6. 0x48
   :   H

The parameters `y` and `x` must be integers greater than or equal to 1.
If either is less than or equal to 0, adjust that parameter to be 1.

The values `y` and `x` are both one-based. For example, the top row is row 1
and the leftmost column on the screen is column 1.

This sequence always unsets the pending wrap state.

If [origin mode](https://ghostty.org/docs/vt/csi/cup.html#TODO) is **NOT** set, the cursor is moved exactly to the
row and column specified by `y` and `x`. The maximum value for `y` is the
bottom row of the screen and the maximum value for `x` is the rightmost
column of the screen.

If [origin mode](https://ghostty.org/docs/vt/csi/cup.html#TODO) is set, the cursor position is set relative
to the top-left corner of the scroll region. `y = 1` corresponds to
the [top margin](https://ghostty.org/docs/vt/csi/cup.html#TODO) and `x = 1` corresponds to the [left margin](https://ghostty.org/docs/vt/csi/cup.html#TODO).
The maximum value for `y` is the [bottom margin](https://ghostty.org/docs/vt/csi/cup.html#TODO) and the maximum
value for `x` is the [right margin](https://ghostty.org/docs/vt/csi/cup.html#TODO).

When origin mode is set, it is impossible set a cursor position using
this sequence outside the boundaries of the scroll region.

## Validation

### CUP V-1: Normal Usage

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[2;3H"
printf "A"
```

```
|__________|
|__Ac______|
```

### CUP V-2: Off the Screen

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[500;500H"
printf "A"
```

```
|__________|
|__________|
|_________Ac
```

### CUP V-3: Relative to Origin

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[2;3r" # scroll region top/bottom
printf "\033[?6h" # origin mode
printf "\033[1;1H" # move to top-left
printf "X"
```

```
|__________|
|X_________|
```

### CUP V-4: Relative to Origin with Left/Right Margins

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?69h" # enable left/right margins
printf "\033[3;5s" # scroll region left/right
printf "\033[2;3r" # scroll region top/bottom
printf "\033[?6h" # origin mode
printf "\033[1;1H" # move to top-left
printf "X"
```

```
|__________|
|__X_______|
```

### CUP V-5: Limits with Scroll Region and Origin Mode

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?69h" # enable left/right margins
printf "\033[3;5s" # scroll region left/right
printf "\033[2;3r" # scroll region top/bottom
printf "\033[?6h" # origin mode
printf "\033[500;500H" # move to top-left
printf "X"
```

```
|__________|
|__________|
|____X_____|
```

### CUP V-6: Pending Wrap is Unset

```
cols=$(tput cols)
printf "\033[${cols}G" # move to last column
printf "A" # set pending wrap state
printf "\033[1;1H"
printf "X"
```

```
|Xc_______X|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/cup.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/cup.html#validation)
* [CUP V-1: Normal Usage](https://ghostty.org/docs/vt/csi/cup.html#cup-v-1:-normal-usage)
* [CUP V-2: Off the Screen](https://ghostty.org/docs/vt/csi/cup.html#cup-v-2:-off-the-screen)
* [CUP V-3: Relative to Origin](https://ghostty.org/docs/vt/csi/cup.html#cup-v-3:-relative-to-origin)
* [CUP V-4: Relative to Origin with Left/Right Margins](https://ghostty.org/docs/vt/csi/cup.html#cup-v-4:-relative-to-origin-with-leftright-margins)
* [CUP V-5: Limits with Scroll Region and Origin Mode](https://ghostty.org/docs/vt/csi/cup.html#cup-v-5:-limits-with-scroll-region-and-origin-mode)
* [CUP V-6: Pending Wrap is Unset](https://ghostty.org/docs/vt/csi/cup.html#cup-v-6:-pending-wrap-is-unset)
