---
title: "Colors - Concepts"
source_url: "https://ghostty.org/docs/vt/concepts/colors"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* Concepts
* [Colors](https://ghostty.org/docs/vt/concepts/colors.html)

# Colors

All sorts of information regarding colors in terminal emulation.

Ghostty emulates a full 256-color palette, as well as 5 **special colors**
and 3 **dynamic colors**.

## Special Colors

The special colors, when specified, are used to color cells with particular
styles — bold, underline, blink, reversed and italic. They can be queried
or changed either with [OSC 4](https://ghostty.org/docs/vt/osc/4.html) using indices from 256 to 260 inclusive,
or [OSC 5](https://ghostty.org/docs/vt/osc/5.html) with indices from 0 to 4 inclusive respectively. The ordinary
palette colors are used instead of special colors when not specified.

## Dynamic Colors

The dynamic colors are used by the terminal to color cells independent of
their own styles, when they are selected, highlighted, etc. They are also
supposed to be *dynamically updated* by programs after the terminal has been
initialized, hence their name. Ghostty currently supports three of these
colors: the foreground color, the background color and the cursor color,
which are queried or modified with [OSCs 10 to 12](https://ghostty.org/docs/vt/osc/1x.html) respectively.

## Color Specifications

Each color in the terminal is specified with a **color specification**.
These originated from xterm, which allows any string that can be parsed by
X11's standard [`XParseColor`](https://linux.die.net/man/3/xparsecolor) function to serve as a color. However, since
Ghostty supports platforms other than X11, we have our own color parser that
is compatible but not guaranteed to be the same as xterm, which is
documented below.

### Hexadecimal RGB

1. 0x72 0x67 0x62 0x3A
   :   rgb:
2. \_\_\_\_
   :   r
3. 0x2F
   :   /
4. \_\_\_\_
   :   g
5. 0x2F
   :   /
6. \_\_\_\_
   :   b



1. 0x23
   :   #
2. \_\_\_\_
   :   r
3. \_\_\_\_
   :   g
4. \_\_\_\_
   :   b

Where each of `r`, `g` and `b` can be one to four hexadecimal digits,
corresponding to 4, 8, 12 or 16 bit color channels respectively.

> Note
>
> When using the `#` syntax, each channel **must have the same number of
> digits**.
>
> Additionally, Ghostty does not yet recognize 16-bit color channels when
> using the `#` syntax. This is a limitation that may be resolved in the
> future.

### Intensity RGB

Another format uses the numerical *intensity* of each channel, as follows:

1. 0x72 0x67 0x62 0x69 0x3A
   :   rgbi:
2. \_\_\_\_
   :   r
3. 0x2F
   :   /
4. \_\_\_\_
   :   g
5. 0x2F
   :   /
6. \_\_\_\_
   :   b

Where each of `r`, `g` and `b` is a decimal number between `0` and `1`.

### Named

Certain colors can also be specified with their names. The exact list of
accepted color names are implementation-defined, but Ghostty uses the
[X color name database](https://gitlab.freedesktop.org/xorg/app/rgb) as used
by X11 itself. The colors are ASCII case-insensitive, meaning `red` and `RED`
correspond to the same color.



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/concepts/colors.mdx)

* [Special Colors](https://ghostty.org/docs/vt/concepts/colors.html#special-colors)
* [Dynamic Colors](https://ghostty.org/docs/vt/concepts/colors.html#dynamic-colors)
* [Color Specifications](https://ghostty.org/docs/vt/concepts/colors.html#color-specifications)
* [Hexadecimal RGB](https://ghostty.org/docs/vt/concepts/colors.html#hexadecimal-rgb)
* [Intensity RGB](https://ghostty.org/docs/vt/concepts/colors.html#intensity-rgb)
* [Named](https://ghostty.org/docs/vt/concepts/colors.html#named)
