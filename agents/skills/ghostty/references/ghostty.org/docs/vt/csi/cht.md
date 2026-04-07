---
title: "Cursor Horizontal Tabulation (CHT) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/cht"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Cursor Horizontal Tabulation (CHT)](https://ghostty.org/docs/vt/csi/cht.html)

# Cursor Horizontal Tabulation (CHT)

Move the cursor right `n` tabs.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x49
   :   I

The parameter `n` must be an integer greater than or equal to 1. If `n` is less than
or equal to 0, adjust `n` to be 1. If `n` is omitted, `n` defaults to 1.

The rightmost valid column for this operation is the rightmost column in
the terminal screen or the [right margin](https://ghostty.org/docs/vt/csi/cht.html#TODO), whichever is smaller.
This sequence does not change behavior with [origin mode](https://ghostty.org/docs/vt/csi/cht.html#TODO) set.

Move the cursor right until the cursor position is on a tabstop. If the
cursor would move past the rightmost valid column, the cursor remains at
the rightmost valid column and the operation completes. Repeat this process
`n` times.

Tabstops are dynamic and can be set with escape sequences such as
[horizontal tab set (HTS)](https://ghostty.org/docs/vt/csi/cht.html#TODO), [tab clear (TBC)](https://ghostty.org/docs/vt/csi/tbc.html), etc.
A terminal emulator may default tabstops at any interval, though an interval
of 8 spaces is most common.

## Validation

### CHT V-1: Right Beyond Last Column

```
printf "\033[?5W" # reset tab stops
printf "\033[100I" # assuming the test terminal has less than 800 columns
printf "A"
```

```
|_________A|
```

### CHT V-2: Right From Before a Tabstop

```
printf "\033[?5W" # reset tab stops
printf "\033[1;2H"
printf "A"
printf "\033[I"
printf "X"
```

```
|_A______X_|
```

### CHT V-3: Right Margin

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[?5W" # reset tab stops
printf "\033[?69h" # enable left/right margins
printf "\033[3;6s" # scroll region left/right
printf "\033[1;1H" # move cursor in region
printf "X"
printf "\033[I"
printf "A"
```

```
|__AX______|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/cht.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/cht.html#validation)
* [CHT V-1: Right Beyond Last Column](https://ghostty.org/docs/vt/csi/cht.html#cht-v-1:-right-beyond-last-column)
* [CHT V-2: Right From Before a Tabstop](https://ghostty.org/docs/vt/csi/cht.html#cht-v-2:-right-from-before-a-tabstop)
* [CHT V-3: Right Margin](https://ghostty.org/docs/vt/csi/cht.html#cht-v-3:-right-margin)
