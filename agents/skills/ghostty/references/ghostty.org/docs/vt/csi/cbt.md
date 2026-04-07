---
title: "Cursor Backward Tabulation (CBT) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/cbt"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Cursor Backward Tabulation (CBT)](https://ghostty.org/docs/vt/csi/cbt.html)

# Cursor Backward Tabulation (CBT)

Move the cursor `n` tabs left.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x5A
   :   Z

The leftmost valid column for this operation is the first column. If
[origin mode](https://ghostty.org/docs/vt/csi/cbt.html#TODO) is enabled, then the leftmost valid column for this
operation is the [left margin](https://ghostty.org/docs/vt/csi/cbt.html#TODO).

Move the cursor left until the cursor position is on a tabstop. If the
cursor would move past the leftmost valid column, the cursor remains at
the leftmost valid column and the operation completes. Repeat this process
`n` times.

Tabstops are dynamic and can be set with escape sequences such as
[horizontal tab set (HTS)](https://ghostty.org/docs/vt/csi/cbt.html#TODO), [tab clear (TBC)](https://ghostty.org/docs/vt/csi/tbc.html), etc.
A terminal emulator may default tabstops at any interval, though an interval
of 8 spaces is most common.

## Validation

### CBT V-1: Left Beyond First Column

```
printf "\033[?5W" # reset tab stops
printf "\033[10Z"
printf "A"
```

```
|Ac________|
```

### CBT V-2: Left Starting After Tab Stop

```
printf "\033[?5W" # reset tab stops
printf "\033[1;10H"
printf "X"
printf "\033[Z"
printf "A"
```

```
|________AX|
```

### CBT V-3: Left Starting on Tabstop

```
printf "\033[?5W" # reset tab stops
printf "\033[1;9H"
printf "X"
printf "\033[1;9H"
printf "\033[Z"
printf "A"
```

```
|A_______X_|
```

### CBT V-4: Left Margin with Origin Mode

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?5W" # reset tab stops
printf "\033[?6h" # enable origin mode
printf "\033[?69h" # enable left/right margins
printf "\033[3;6s" # scroll region left/right
printf "\033[1;2H" # move cursor in region
printf "X"
printf "\033[Z"
printf "A"
```

```
|__AX______|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/cbt.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/cbt.html#validation)
* [CBT V-1: Left Beyond First Column](https://ghostty.org/docs/vt/csi/cbt.html#cbt-v-1:-left-beyond-first-column)
* [CBT V-2: Left Starting After Tab Stop](https://ghostty.org/docs/vt/csi/cbt.html#cbt-v-2:-left-starting-after-tab-stop)
* [CBT V-3: Left Starting on Tabstop](https://ghostty.org/docs/vt/csi/cbt.html#cbt-v-3:-left-starting-on-tabstop)
* [CBT V-4: Left Margin with Origin Mode](https://ghostty.org/docs/vt/csi/cbt.html#cbt-v-4:-left-margin-with-origin-mode)
