---
title: "Screen Alignment Test (DECALN) - ESC"
source_url: "https://ghostty.org/docs/vt/esc/decaln"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* ESC
* [Screen Alignment Test (DECALN)](https://ghostty.org/docs/vt/esc/decaln.html)

# Screen Alignment Test (DECALN)

Reset margins, move cursor to the top left, and fill the screen with `E`.

1. 0x1B
   :   ESC
2. 0x23
   :   #
3. 0x38
   :   8

Reset the top, bottom, left, and right margins and unset [origin mode](https://ghostty.org/docs/vt/esc/decaln.html#TODO).
The cursor is moved to the top-left corner of the screen.

All stylistic SGR attributes are unset, such as bold, blink, etc.
SGR foreground and background colors are preserved.
The [protected attribute](https://ghostty.org/docs/vt/esc/decaln.html#TODO) is not unset.

The entire screen is filled with the character `E`. The letter `E` ignores
the current SGR settings and is written with no styling.

## Validation

### DECALN V-1: Simple Usage

```
printf "\033#8"
```

```
|EEEEEEEE|
|EEEEEEEE|
|EEEEEEEE|
```

### DECALN V-2: Reset Margins

```
printf "\033[2;3r" # scroll region top/bottom
printf "\033#8"
printf "\033[T"
```

```
|c_______|
|EEEEEEEE|
|EEEEEEEE|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/esc/decaln.mdx)

* [Validation](https://ghostty.org/docs/vt/esc/decaln.html#validation)
* [DECALN V-1: Simple Usage](https://ghostty.org/docs/vt/esc/decaln.html#decaln-v-1:-simple-usage)
* [DECALN V-2: Reset Margins](https://ghostty.org/docs/vt/esc/decaln.html#decaln-v-2:-reset-margins)
