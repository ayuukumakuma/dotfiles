---
title: "Carriage Return (CR) - Control"
source_url: "https://ghostty.org/docs/vt/control/cr"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* Control
* [Carriage Return (CR)](https://ghostty.org/docs/vt/control/cr.html)

# Carriage Return (CR)

Move the cursor to the leftmost column.

1. 0x0D
   :   CR

This sequence always unsets the pending wrap state.

If [origin mode (mode 6)](https://ghostty.org/docs/vt/control/cr.html#TODO) is enabled, the cursor is set to the
[left margin](https://ghostty.org/docs/vt/control/cr.html#TODO) of the scroll region and the operation is complete.

If origin mode is *not* set and the cursor is on or to the right of the
left margin, the cursor is set to the left margin. If the cursor is to the left
of the left margin, the cursor is moved to the leftmost column in the terminal.

## Validation

### CR V-1: Pending Wrap is Unset

```
cols=$(tput cols)
printf "\033[${cols}G" # move to last column
printf "A" # set pending wrap state
printf "\r"
printf "X"
echo
```

```
|X________A|
|c_________|
```

### CR V-2: Left Margin

```
cols=$(tput cols)
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?69h" # enable left/right margin mode
printf "\033[2;5s" # set left/right margin
printf "\033[4G"
printf "A"
printf "\r"
printf "X"
```

```
|_XcA______|
```

### CR V-3: Left of Left Margin

```
cols=$(tput cols)
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?69h" # enable left/right margin mode
printf "\033[2;5s" # set left/right margin
printf "\033[4G"
printf "A"
printf "\033[1G"
printf "\r"
printf "X"
```

```
|Xc_A______|
```

### CR V-3: Left Margin with Origin Mode

```
cols=$(tput cols)
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?6h" # enable origin mode
printf "\033[?69h" # enable left/right margin mode
printf "\033[2;5s" # set left/right margin
printf "\033[4G"
printf "A"
printf "\033[1G"
printf "\r"
printf "X"
```

```
|_XcA______|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/control/cr.mdx)

* [Validation](https://ghostty.org/docs/vt/control/cr.html#validation)
* [CR V-1: Pending Wrap is Unset](https://ghostty.org/docs/vt/control/cr.html#cr-v-1:-pending-wrap-is-unset)
* [CR V-2: Left Margin](https://ghostty.org/docs/vt/control/cr.html#cr-v-2:-left-margin)
* [CR V-3: Left of Left Margin](https://ghostty.org/docs/vt/control/cr.html#cr-v-3:-left-of-left-margin)
* [CR V-3: Left Margin with Origin Mode](https://ghostty.org/docs/vt/control/cr.html#cr-v-3:-left-margin-with-origin-mode)
