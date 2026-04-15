---
title: "Save Cursor (DECSC) - ESC"
source_url: "https://ghostty.org/docs/vt/esc/decsc"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* ESC
* [Save Cursor (DECSC)](https://ghostty.org/docs/vt/esc/decsc.html)

# Save Cursor (DECSC)

Save various cursor-related state that can be restored with
Restore Cursor (DECRC).

1. 0x1B
   :   ESC
2. 0x37
   :   7

The following attributes are saved:

* Cursor row and column in absolute screen coordinates
* Character sets
* Pending wrap state
* SGR attributes
* [Origin mode (DEC Mode 6)](https://ghostty.org/docs/vt/esc/decsc.html#TODO)

Only one cursor can be saved at any time. If save cursor is repeated, the
previously save cursor is overwritten.

Primary and alternate screens have separate saved cursor state. A cursor
saved on the primary screen is inaccessible from the alternate screen
and vice versa.

## Validation

### SC V-1: Cursor Position

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[1;5H"
printf "A"
printf "\0337" # Save Cursor
printf "\033[1;1H"
printf "B"
printf "\0338" # Restore Cursor
printf "X"
```

```
|B___AX____|
```

### SC V-2: Pending Wrap State

```
cols=$(tput cols)
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[${cols}G"
printf "A"
printf "\0337" # Save Cursor
printf "\033[1;1H"
printf "B"
printf "\0338" # Restore Cursor
printf "X"
```

```
|B________A|
|X_________|
```

### SC V-3: SGR Attributes

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[1;4;33;44m"
printf "A"
printf "\0337" # Save Cursor
printf "\033[0m"
printf "B"
printf "\0338" # Restore Cursor
printf "X"
```

```
|AX________|
```

The "A" and "X" should have identical styling.



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/esc/decsc.mdx)

* [Validation](https://ghostty.org/docs/vt/esc/decsc.html#validation)
* [SC V-1: Cursor Position](https://ghostty.org/docs/vt/esc/decsc.html#sc-v-1:-cursor-position)
* [SC V-2: Pending Wrap State](https://ghostty.org/docs/vt/esc/decsc.html#sc-v-2:-pending-wrap-state)
* [SC V-3: SGR Attributes](https://ghostty.org/docs/vt/esc/decsc.html#sc-v-3:-sgr-attributes)
