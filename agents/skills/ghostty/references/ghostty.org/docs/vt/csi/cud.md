---
title: "Cursor Down (CUD) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/cud"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Cursor Down (CUD)](https://ghostty.org/docs/vt/csi/cud.html)

# Cursor Down (CUD)

Move the cursor down `n` cells.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x42
   :   B

The parameter `n` must be an integer greater than or equal to 1. If `n` is less than
or equal to 0, adjust `n` to be 1. If `n` is omitted, `n` defaults to 1.

This sequence always unsets the pending wrap state.

If the current cursor position is at or above the [bottom margin](https://ghostty.org/docs/vt/csi/cud.html#TODO),
the lowest point the cursor can move is the bottom margin. If the current
cursor position is below the bottom margin, the lowest point the cursor
can move is the final row.

This sequence never triggers scrolling.

## Validation

### CUD V-1: Cursor Down

```
printf "A"
printf "\033[2B" # cursor down
printf "X"
```

```
|A_________|
|__________|
|_Xc_______|
```

### CUD V-2: Cursor Down Above Bottom Margin

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\n\n\n\n" # screen is 4 high
printf "\033[1;3r" # set scrolling region
printf "A"
printf "\033[5B" # cursor down
printf "X"
```

```
|A_________|
|__________|
|_Xc_______|
|__________|
```

### CUD V-3: Cursor Down Below Bottom Margin

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\n\n\n\n\n" # screen is 5 high
printf "\033[1;3r" # set scrolling region
printf "A"
printf "\033[4;1H" # move below region
printf "\033[5B" # cursor down
printf "X"
```

```
|A_________|
|__________|
|__________|
|__________|
|_Xc_______|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/cud.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/cud.html#validation)
* [CUD V-1: Cursor Down](https://ghostty.org/docs/vt/csi/cud.html#cud-v-1:-cursor-down)
* [CUD V-2: Cursor Down Above Bottom Margin](https://ghostty.org/docs/vt/csi/cud.html#cud-v-2:-cursor-down-above-bottom-margin)
* [CUD V-3: Cursor Down Below Bottom Margin](https://ghostty.org/docs/vt/csi/cud.html#cud-v-3:-cursor-down-below-bottom-margin)
