---
title: "Cursor Backward (CUB) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/cub"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Cursor Backward (CUB)](https://ghostty.org/docs/vt/csi/cub.html)

# Cursor Backward (CUB)

Move the cursor left `n` cells.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x44
   :   D

The parameter `n` must be an integer greater than or equal to 1. If `n` is less than
or equal to 0, adjust `n` to be 1. If `n` is omitted, `n` defaults to 1.

This sequence always unsets the
[pending wrap state](https://ghostty.org/docs/vt/concepts/cursor.html#pending-wrap-state).

The leftmost boundary the cursor can move to is determined by the current
cursor column and the [left margin](https://ghostty.org/docs/vt/csi/cub.html#TODO). If the cursor begins to the left of the left margin, modify the left margin to be the leftmost column
for the duration of the sequence. The leftmost column the cursor can be on
is the left margin.

With the above in place, there are three different cursor backward behaviors
depending on the mode state of the terminal. The possible behaviors are listed
below. In the case of a conflict, the top-most behavior takes priority.

* **Extended reverse wrap**: [wraparound (mode 7)](https://ghostty.org/docs/vt/csi/cub.html#TODO) and [extended reverse wrap (mode 1045)](https://ghostty.org/docs/vt/csi/cub.html#TODO)
  are **BOTH** enabled
* **Reverse wrap**: [wraparound (mode 7)](https://ghostty.org/docs/vt/csi/cub.html#TODO) and [reverse wrap (mode 45)](https://ghostty.org/docs/vt/csi/cub.html#TODO)
  are **BOTH** enabled
* **No wrap**: The default behavior if the above wrapping behaviors
  do not have their conditions met.

For the **no wrap** behavior, move the cursor to the left `n` cells while
respecting the aforementioned leftmost boundary. Upon reaching the leftmost
boundary, stop moving the cursor left regardless of the remaining value of `n`.
The cursor row remains unchanged.

For the **extended reverse wrap** behavior, move the cursor to the left `n`
cells while respecting the aforementioned leftmost boundary. Upon reaching the
leftmost boundary, if `n > 0` then move the cursor to the [right margin](https://ghostty.org/docs/vt/csi/cub.html#TODO)
of the line above the cursor. If the cursor is already on the
[top margin](https://ghostty.org/docs/vt/csi/cub.html#TODO), move the cursor to the right margin of the
[bottom margin](https://ghostty.org/docs/vt/csi/cub.html#TODO). Both the cursor column and row can change in this
mode. Compared to non-extended reverse wrap, the two critical differences are
that extended reverse wrap doesn't require the previous line to be wrapped
and extended reverse wrap will wrap around to the bottom margin.

For the **reverse wrap** (non-extended) behavior, move the cursor to the left `n`
cells while respecting the aforementioned leftmost boundary. Upon reaching the
leftmost boundary, if `n > 0` and the previous line was wrapped, then move the
cursor to the [right margin](https://ghostty.org/docs/vt/csi/cub.html#TODO) of the line above the cursor. If the previous
line was not wrapped, the cursor left operation is complete even if there
is a remaining value of `n`. If the cursor
is already on the [top margin](https://ghostty.org/docs/vt/csi/cub.html#TODO), do not move the cursor up.
This wrapping mode does not wrap the cursor row back to the bottom margin.

For **extended reverse wrap** or **reverse wrap** modes, if the pending
wrap state is set, decrease `n` by 1. In these modes, the initial cursor
backward count is consumed by the pending wrap state, as if you pressed
"backspace" on an empty newline and the cursor moved back to the previous line.

## Validation

### CUB V-1: Pending Wrap is Unset

```
cols=$(tput cols)
printf "\033[${cols}G" # move to last column
printf "A" # set pending wrap state
printf "\033[D" # move back one
printf "XYZ"
```

```
|________XY|
|Zc________|
```

### CUB V-2: Leftmost Boundary with Reverse Wrap Disabled

```
printf "\033[?45l" # disable reverse wrap
echo "A"
printf "\033[10D" # back
printf "B"
```

```
|A_________|
|Bc________|
```

### CUB V-3: Reverse Wrap

```
cols=$(tput cols)
printf "\033[?7h" # enable wraparound
printf "\033[?45h" # enable reverse wrap
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[${cols}G" # move to end of line
printf "AB" # write and wrap
printf "\033[D" # move back two
printf "X"
```

```
|_________Xc
|B_________|
```

### CUB V-4: Extended Reverse Wrap Single Line

```
printf "\033[?7h" # enable wraparound
printf "\033[?1045h" # enable extended reverse wrap
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
echo "A"
printf "B"
printf "\033[2D" # move back two
printf "X"
```

```
|A________Xc
|B_________|
```

### CUB V-5: Extended Reverse Wrap Wraps to Bottom

```
cols=$(tput cols)
printf "\033[?7h" # enable wraparound
printf "\033[?1045h" # enable extended reverse wrap
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[1;3r" # set scrolling region
echo "A"
printf "B"
printf "\033[D" # move back one
printf "\033[${cols}D" # move back entire width
printf "\033[D" # move back one
printf "X"
```

```
|A_________|
|B_________|
|_________Xc
```

### CUB V-6: Reverse Wrap Outside of Margins

```
printf "\033[1;1H"
printf "\033[0J"
printf "\033[?45h"
printf "\033[3r"
printf "\b"
printf "X"
```

```
|__________|
|__________|
|Xc________|
```

### CUB V-7: Reverse Wrap with Pending Wrap State

```
cols=$(tput cols)
printf "\033[?45h"
printf "\033[${cols}G"
printf "\033[4D"
printf "ABCDE"
printf "\033[D"
printf "X"
```

```
|_____ABCDX|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/cub.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/cub.html#validation)
* [CUB V-1: Pending Wrap is Unset](https://ghostty.org/docs/vt/csi/cub.html#cub-v-1:-pending-wrap-is-unset)
* [CUB V-2: Leftmost Boundary with Reverse Wrap Disabled](https://ghostty.org/docs/vt/csi/cub.html#cub-v-2:-leftmost-boundary-with-reverse-wrap-disabled)
* [CUB V-3: Reverse Wrap](https://ghostty.org/docs/vt/csi/cub.html#cub-v-3:-reverse-wrap)
* [CUB V-4: Extended Reverse Wrap Single Line](https://ghostty.org/docs/vt/csi/cub.html#cub-v-4:-extended-reverse-wrap-single-line)
* [CUB V-5: Extended Reverse Wrap Wraps to Bottom](https://ghostty.org/docs/vt/csi/cub.html#cub-v-5:-extended-reverse-wrap-wraps-to-bottom)
* [CUB V-6: Reverse Wrap Outside of Margins](https://ghostty.org/docs/vt/csi/cub.html#cub-v-6:-reverse-wrap-outside-of-margins)
* [CUB V-7: Reverse Wrap with Pending Wrap State](https://ghostty.org/docs/vt/csi/cub.html#cub-v-7:-reverse-wrap-with-pending-wrap-state)
